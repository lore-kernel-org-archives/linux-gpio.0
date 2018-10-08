From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: protected pins and debugfs
Date: Sun, 07 Oct 2018 23:04:02 -0700
Message-ID: <153897864285.119890.13024399324598460044@swboyd.mtv.corp.google.com>
References: <9aec322678417753fe4022691f4bfdbe@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <9aec322678417753fe4022691f4bfdbe@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sodagudi Prasad <psodagud@codeaurora.org>, bjorn.andersson@linaro.org, linus.walleij@linaro.org, sboyd@codeaurora.org
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Quoting Sodagudi Prasad (2018-10-03 05:38:24)
> =

>          for (i =3D 0; i < chip->ngpio; i++, gpio++) {
> +               label =3D gpiochip_is_requested(chip, i);
> +               if (!label)
> +                       continue;
>                  msm_gpio_dbg_show_one(s, NULL, chip, i, gpio);
> -               seq_puts(s, "\n");
>          }
>   }
> =


Does something not work with the following code in
msm_gpio_dbg_show_one()?


        if (!gpiochip_line_is_valid(chip, offset))
		return;
