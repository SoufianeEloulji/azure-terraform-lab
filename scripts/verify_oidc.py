"""Joue le rôle du cloud : vérifie un jeton OIDC GitHub (signature + claims)."""
import json
import os
import sys
import urllib.request

import jwt  # PyJWT

ISSUER = "https://token.actions.githubusercontent.com"
AUDIENCE = "api://AzureADTokenExchange"


def get_token() -> str:
    url = os.environ["ACTIONS_ID_TOKEN_REQUEST_URL"] + "&audience=" + AUDIENCE
    req = urllib.request.Request(
        url,
        headers={"Authorization": "bearer " + os.environ["ACTIONS_ID_TOKEN_REQUEST_TOKEN"]},
    )
    return json.load(urllib.request.urlopen(req))["value"]


def main() -> int:
    expected_sub = sys.argv[1]
    token = get_token()

    # 1. Récupérer la clé publique de GitHub et vérifier la signature,
    #    l'issuer et l'audience
    signing_key = jwt.PyJWKClient(ISSUER + "/.well-known/jwks").get_signing_key_from_jwt(token)
    claims = jwt.decode(
        token,
        signing_key.key,
        algorithms=["RS256"],
        audience=AUDIENCE,
        issuer=ISSUER,
    )

    # 2. Condition de confiance : le "sub" doit correspondre
    #    (c'est le rôle d'une federated credential Azure)
    print(f"sub reçu    : {claims['sub']}")
    print(f"sub attendu : {expected_sub}")
    if claims["sub"] != expected_sub:
        print("REFUSÉ : le sub ne correspond à aucune credential de confiance.")
        return 1

    print("ACCEPTÉ : signature valide et sub reconnu. Un cloud délivrerait ici un accès temporaire.")
    return 0


if __name__ == "__main__":
    sys.exit(main())