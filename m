From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH] tools: gpio: Add include/linux/gpio.h to .gitignore
Date: Mon, 20 May 2019 15:45:01 +0200
Message-ID: <CAMpxmJWCD0yOTyEfQhU59BsvnUoGkwWC3cEnS8Dn9W7EupA2Wg@mail.gmail.com>
References: <20190512053749.7508-1-skunberg.kelsey@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190512053749.7508-1-skunberg.kelsey@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kelsey Skunberg <skunberg.kelsey@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio <linux-gpio@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, skhan@linuxfoundation.org, linux-kernel-mentees@lists.linuxfoundation.org
List-Id: linux-gpio@vger.kernel.org

niedz., 12 maj 2019 o 07:38 Kelsey Skunberg
<skunberg.kelsey@gmail.com> napisa=C5=82(a):
>
> File include/linux/gpio.h is generated after building
> tools/testing/selftests
>
> Add gpio.h to .gitignore to help clean up working tree status.
>
> Signed-off-by: Kelsey Skunberg <skunberg.kelsey@gmail.com>
> ---
>  tools/gpio/.gitignore | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tools/gpio/.gitignore b/tools/gpio/.gitignore
> index 9e9dd4b681b2..a94c0e83b209 100644
> --- a/tools/gpio/.gitignore
> +++ b/tools/gpio/.gitignore
> @@ -1,4 +1,4 @@
>  gpio-event-mon
>  gpio-hammer
>  lsgpio
> -
> +include/linux/gpio.h
> --
> 2.20.1
>

Patch applied, thanks!

Bartosz
