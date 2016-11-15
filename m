From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: vt8500: make bool drivers explicitly non-modular
Date: Tue, 15 Nov 2016 10:04:55 +0100
Message-ID: <CACRpkdbr+TcyLZrX6ZFs+xYOb4MOcGLJ7UKeESuWE7EmATUiOQ@mail.gmail.com>
References: <20161109154558.13106-1-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20161109154558.13106-1-paul.gortmaker@windriver.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Tony Prisk <linux@prisktech.co.nz>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, Nov 9, 2016 at 4:45 PM, Paul Gortmaker
<paul.gortmaker@windriver.com> wrote:

> None of the Kconfigs for any of these drivers are tristate, meaning
> that they currently are not being built as a module by anyone.
>
> Lets remove the modular code that is essentially orphaned, so that
> when reading the drivers there is no doubt they are builtin-only.  All
> drivers get the exact same change, so they are handled in batch.
>
> Changes are (1) use builtin_platform_driver, (2) use init.h header
> (3) delete module_exit related code, (4) delete MODULE_DEVICE_TABLE,
> (5) delete MODULE_LICENCE/MODULE_AUTHOR and associated tags and (6)
> drop ".remove" code and prevent sysfs unbind attempts to call ".remove".
>
> Once this is done, the shared remove function in wmt.[ch] is no longer
> used and hence it is removed as well.
>
> Since module_platform_driver() uses the same init level priority as
> builtin_platform_driver() the init ordering remains unchanged with
> this commit.
>
> Also note that MODULE_DEVICE_TABLE is a no-op for non-modular code.
>
> We also delete the MODULE_LICENSE etc. tags since all that information
> is already contained at the top of each file in the comments.
>
> Cc: Tony Prisk <linux@prisktech.co.nz>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: linux-gpio@vger.kernel.org
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>

Patch applied.

Yours,
Linus Walleij
