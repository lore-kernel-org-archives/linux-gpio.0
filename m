From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/8] gpio/-mm-lantiq: Use devm_kzalloc
Date: Tue, 20 Jan 2015 11:07:43 +0100
Message-ID: <CACRpkdaK8dexHkc02uRX-OAzgQ8HtnWou_1qFpcK9VMrwN7Sog@mail.gmail.com>
References: <1421581173-28416-1-git-send-email-ricardo.ribalda@gmail.com>
	<1421581173-28416-3-git-send-email-ricardo.ribalda@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1421581173-28416-3-git-send-email-ricardo.ribalda@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, John Crispin <blogic@openwrt.org>
List-Id: linux-gpio@vger.kernel.org

On Sun, Jan 18, 2015 at 12:39 PM, Ricardo Ribalda Delgado
<ricardo.ribalda@gmail.com> wrote:

> Replace kzalloc with the device managed devm_kzalloc
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Alexandre Courbot <gnurou@gmail.com>
> Cc: John Crispin <blogic@openwrt.org>
> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>

Patch applied.

Yours,
Linus Walleij
