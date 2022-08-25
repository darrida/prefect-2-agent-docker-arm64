# Prefect 2 Docker Based Agent

## Notes on Arm64 Image Exploration
- using `arm64v8/python:3.10.6-bullseye`
- had to use the full python image, because the slim version was missing dependencies required to build an arm64 wheel for asyncpg (which took quite a while on an i7-8650u)
- the image size is massive (1.5gb) for what it is now -- need to look into taking extra steps to reduce the size (just trying to get it to work for starters)