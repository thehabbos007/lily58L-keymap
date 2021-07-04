FROM qmkfm/base_container:latest

RUN cd / && \
    git clone https://github.com/qmk/qmk_firmware.git --single-branch --depth 1 && \
    mkdir -p qmk_firmware/keyboards/lily58/keymaps/lily58l && \
		cd /qmk_firmware && \
		make git-submodule

WORKDIR /qmk_firmware

CMD make lily58/light:lily58l && \
    cp lily58_light_lily58l.hex keyboards/lily58/keymaps/lily58l
