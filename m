From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] tools/gpio/gpio-event-mon: fix warning
Date: Thu, 1 Mar 2018 15:27:41 +0100
Message-ID: <CACRpkdbPU=O68q=VY1Qbibmk01MC9j9uiEXOmd65kG5pg_L3AQ@mail.gmail.com>
References: <20180221213334.19969-1-anders.roxell@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180221213334.19969-1-anders.roxell@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Anders Roxell <anders.roxell@linaro.org>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, Feb 21, 2018 at 10:33 PM, Anders Roxell
<anders.roxell@linaro.org> wrote:

> PRIu64 is defined in user space to match libc's uint64_t definition.
> However, gpioevent_data structure in the kernel is defined using the
> kernel's own __u64 type.
>
> gpio-event-mon.c: In function =E2=80=98monitor_device=E2=80=99:
> gpio-event-mon.c:102:19: warning: format =E2=80=98%lu=E2=80=99 expects ar=
gument of type
>     =E2=80=98long unsigned int=E2=80=99, but argument 3 has type =E2=80=
=98__u64 {aka long long
>     unsigned int}=E2=80=99 [-Wformat=3D]
>    fprintf(stdout, "GPIO EVENT %" PRIu64 ": ", event.timestamp);
>                    ^~~~~~~~~~~~~~
>   LD       /tmp/kselftest/gpiogpio-event-mon-in.o
>   LINK     /tmp/kselftest/gpiogpio-event-mon
>
> Fix is to replace PRIu64 with llu, which we know is what the kernel uses
> for __u64.
>
> Signed-off-by: Anders Roxell <anders.roxell@linaro.org>

Patch applied with Daniel's test tag.

Yours,
Linus Walleij
