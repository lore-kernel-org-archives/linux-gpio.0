From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: intel-mid: Fix build warning when !CONFIG_PM
Date: Tue, 17 Jan 2017 16:09:46 +0100
Message-ID: <CACRpkdYUBNHQfF7V_A+zDLrcUBFuUg1R1DjgtXLdqYRZe4CEGw@mail.gmail.com>
References: <1484577077-13418-1-git-send-email-augustocaringi@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1484577077-13418-1-git-send-email-augustocaringi@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Augusto Mecking Caringi <augustocaringi@gmail.com>
Cc: David Cohen <david.a.cohen@linux.intel.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, Jan 16, 2017 at 3:30 PM, Augusto Mecking Caringi
<augustocaringi@gmail.com> wrote:

> The only usage of function intel_gpio_runtime_idle() is here (in the
> same file):
>
> static const struct dev_pm_ops intel_gpio_pm_ops =3D {
>         SET_RUNTIME_PM_OPS(NULL, NULL, intel_gpio_runtime_idle)
> };
>
> And when CONFIG_PM is not set, the macro SET_RUNTIME_PM_OPS expands to
> nothing, causing the following compiler warning:
>
> drivers/gpio/gpio-intel-mid.c:324:12: warning: =E2=80=98intel_gpio_runtim=
e_idle=E2=80=99
> defined but not used [-Wunused-function]
> static int intel_gpio_runtime_idle(struct device *dev)
>
> Fix it by annotating the function with __maybe_unused.
>
> Signed-off-by: Augusto Mecking Caringi <augustocaringi@gmail.com>

Patch applied with Andy's ACK.

Yours,
Linus Walleij
