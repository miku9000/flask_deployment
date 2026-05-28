Enne paigaldamist muuda terraform kaustas vars.tf failis muutujad.

Lisaks enne paigaldamist muuta SSH privaat võtme õiguseid: sudo chmod 600 ~/.ssh/PRIVATE_KEY

Kui on vaja muuta mis IP iga masin kasutab, on vaja muuta vars.tf ja ansible kaustas inventory fail.

Deployment:

Terraform kaustas: terraform init && terraform apply

Ansible kaustas: ansible-playbook -i ./inventory ./deploy.yml