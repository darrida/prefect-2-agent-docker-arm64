# Prefect 2 Docker Based Agent for arm64

- arm64: Multi-stage image build
  - Full image required, because so many wheels don't exist for arm64, and have to be built on the spot
  - Actual package wheels installed on a "slim" image, and removed after
- This image is currently in successful use on a Raspberry Pi 4 running a recent version of Raspbian
