From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/3] pinctrl: mvebu: make bool drivers explicitly non-modular
Date: Mon, 13 Feb 2017 14:22:24 +0100
Message-ID: <CACRpkdY1ddTYDoXmU=Z6gkmXJPsUrYcpwjPH66TroWsxGwh1rQ@mail.gmail.com>
References: <20170206080352.17808-1-paul.gortmaker@windriver.com> <20170206080352.17808-2-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170206080352.17808-2-paul.gortmaker@windriver.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, Feb 6, 2017 at 9:03 AM, Paul Gortmaker
<paul.gortmaker@windriver.com> wrote:

> None of the Kconfigs for any of these drivers are tristate, meaning
> that they currently are not being built as a module by anyone.
>
> Lets remove the modular code that is essentially orphaned, so that
> when reading the drivers there is no doubt they are builtin-only.
> All drivers get the exact same change, so they are handled in batch.
>
> Changes are (1) use builtin_platform_driver, (2) dont use module.h
> (3) delete module_exit related code, (4) delete MODULE_DEVICE_TABLE,
> and (5) delete MODULE_LICENCE/MODULE_AUTHOR and associated tags.
>
> For the dove driver we explicitly disallow a driver unbind, since
> that doesn't have a sensible use case anyway, and it allows us to
> drop the ".remove" code for non-modular drivers.
>
> Since module_platform_driver() uses the same init level priority as
> builtin_platform_driver() the init ordering remains unchanged with
> this commit.
>
> We deleted the MODULE_LICENSE etc. tags since all that information
> is already contained at the top of the file in the comments.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: linux-gpio@vger.kernel.org
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>

Patch applied.

Yours,
Linus Walleij
