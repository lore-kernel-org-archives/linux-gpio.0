From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: Rework Kconfig dependency for BM1880 pinctrl driver
Date: Thu, 25 Apr 2019 10:50:58 +0200
Message-ID: <CACRpkdY8MCfS5McDAGBhFGUxb-eioW9+GAmEgOYKmrSZgkY4JA@mail.gmail.com>
References: <20190425083224.9762-1-manivannan.sadhasivam@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190425083224.9762-1-manivannan.sadhasivam@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, haitao.suo@bitmain.com, darren.tsao@bitmain.com, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, Apr 25, 2019 at 10:32 AM Manivannan Sadhasivam
<manivannan.sadhasivam@linaro.org> wrote:

> Make the BM1880 SoC pinctrl driver depend on COMPILE_TEST to get compiler
> test coverage and also select this driver by default for ARCH_BITMAIN
> platform.
>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Patch applied.

Yours,
Linus Walleij
