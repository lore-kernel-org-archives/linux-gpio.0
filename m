From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 6/6] pinctrl: sirf: make core support explicitly non-modular
Date: Sat, 27 Aug 2016 13:16:39 +0200
Message-ID: <CACRpkdaQ=9TKzyTV=HZ9cB7c2teaXRU8SMvqs5wsu4nXCmxBfQ@mail.gmail.com>
References: <20160823211944.18554-1-paul.gortmaker@windriver.com> <20160823211944.18554-7-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160823211944.18554-7-paul.gortmaker@windriver.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rongjun Ying <rongjun.ying@csr.com>, Yuping Luo <yuping.luo@csr.com>, Barry Song <baohua@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Aug 23, 2016 at 11:19 PM, Paul Gortmaker
<paul.gortmaker@windriver.com> wrote:

> The Makefile currently controlling compilation of this code is:
>
>   drivers/pinctrl/sirf/pinctrl-sirf.o
>       --> drivers/pinctrl/sirf/Makefile:obj-y += pinctrl-sirf.o
>
> ...meaning that it currently is not being built as a module by anyone.
>
> Lets remove the couple traces of modular infrastructure use, so that
> when reading the driver there is no doubt it is builtin-only.
>
> We also delete the MODULE_LICENSE tag etc. since all that information
> was (or is now) contained at the top of the file in the comments.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Rongjun Ying <rongjun.ying@csr.com>
> Cc: Yuping Luo <yuping.luo@csr.com>
> Cc: Barry Song <baohua@kernel.org>
> Cc: linux-gpio@vger.kernel.org
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>

Patch applied.

Yours,
Linus Walleij
