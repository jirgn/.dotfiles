## this assumes you already have a kubeconfig in place, that has setup contexts for the different stages "edtech_dev", "edtech_test", "edtech_stage", "edtech_prod"
create_sopskeys_aa() {
  for stage in dev test stage prod; do
    kubectl config use-context "edtech_${stage}" 2 &>/dev/null
    for namespace in $(kubectl get ns --no-headers -o custom-columns=":metadata.name" -l 'cornelsen.de/owner=aa'); do
      kubectl get secrets sops-age -n "${namespace}" -o json | jq -r '.data."age.agekey"' | base64 -d
    done
  done >sopskeys_aa
}
