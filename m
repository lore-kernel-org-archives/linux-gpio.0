From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: pca953x: Fix NBANK calculation for PCA9536
Date: Mon, 13 Jun 2016 09:22:27 +0200
Message-ID: <CACRpkdYZEbefjr-iHT3yahkBovFuE2Ofvr8_Mr+X++pJSVwzfA@mail.gmail.com>
References: <20160609053204.32398-1-vigneshr@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160609053204.32398-1-vigneshr@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vignesh R <vigneshr@ti.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, Jun 9, 2016 at 7:32 AM, Vignesh R <vigneshr@ti.com> wrote:

> NBANK() macro assumes that ngpios is a multiple of 8(BANK_SZ) and
> hence results in 0 banks for PCA9536 which has just 4 gpios. This is
> wrong as PCA9356 has 1 bank with 4 gpios. This results in uninitialized
> PCA953X_INVERT register. Fix this by using DIV_ROUND_UP macro in
> NBANK().
>
> Cc: stable@vger.kernel.org
> Signed-off-by: Vignesh R <vigneshr@ti.com>

Patch applied.

Is this really a regression or affecting systems in development?

Which machine/device tree makes this problematic?

Yours,
Linus Walleij
