FROM archlinux:latest

RUN pacman -Syu --noconfirm
RUN pacman -S git ansible sudo --noconfirm

RUN echo pass | passwd root --stdin

RUN useradd -m -G wheel --shell /bin/bash andrei
RUN echo pass | passwd andrei --stdin
RUN sed -i 's/# %wheel ALL=(ALL:ALL) ALL/%wheel ALL=(ALL:ALL) ALL/g' /etc/sudoers

USER andrei
WORKDIR /home/andrei

COPY . .

CMD ["sh" , "-c", "resources/setup"]
