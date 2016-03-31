From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] tools/gpio: Add missing initialization of device_name
Date: Thu, 31 Mar 2016 11:51:55 +0200
Message-ID: <CACRpkdZ6j6O9kkoes+WJ_Fgu3+_dQ1Zg7JbzEJR88d3inVW3gA@mail.gmail.com>
References: <1458909390-2686-1-git-send-email-geert+renesas@glider.be>
	<1458909390-2686-3-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1458909390-2686-3-git-send-email-geert+renesas@glider.be>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Fri, Mar 25, 2016 at 1:36 PM, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> lsgpio.c: In function =E2=80=98main=E2=80=99:
> lsgpio.c:166:7: warning: =E2=80=98device_name=E2=80=99 may be used un=
initialized in this functio
> n [-Wmaybe-uninitialized]
>    ret =3D list_device(device_name);
>        ^
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Patch applied.

Yours,
Linus Walleij
