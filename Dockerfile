FROM superherointj/archlinux-base
RUN pacman -S --noconfirm pony-stable
# Test 1: Does it exist and is it broken?
RUN stable version
# Test 2: Does it work?
RUN mkdir myproject && cd myproject
RUN stable add github jemc/pony-inspect
RUN printf 'use "inspect"\nactor Main\n  new create(env: Env) =>\n    env.out.print(Inspect("Hello, World!"))\n' > main.pony
RUN stable fetch
RUN stable env ponyc --debug