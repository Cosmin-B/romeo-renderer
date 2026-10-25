# romeo-renderer

A small C++20 tile-based CPU rasterizer with worker threads, a texture cache and a streaming asset loader. It is the
target codebase for the Romeo demo: an always-on engineering agent investigates performance, memory, crash and image
regressions in it, writes a regression check, writes a fix and opens a pull request.

```sh
cmake -S . -B build -G Ninja && ninja -C build
./build/romeo-render --setup B --frames 300 --trace --out runs/b
```

Setups: A 1 view 1080p, B 4 views 1080p, C 1 view 4K, D 8 views 1440p, E 12 views 1080p.
Each run writes frames.csv, memory.csv, log.jsonl, summary.json, image.png and, with --trace, a Chrome trace.

Branches named `change/case-XX` hold changes under investigation. Pull requests from `fix/case-XX` are opened by the agent.
