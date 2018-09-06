From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: ep93xx: fix test for end of loop
Date: Thu, 6 Sep 2018 16:31:49 +0200
Message-ID: <CACRpkdakEX+3aknFj8f7q97bqQvZXDqaRNG8wqFG4bWBb=tPmg@mail.gmail.com>
References: <CACRpkdaHabhD_pW3XtDh+XzQ3d--r=qNRZVnhx44RV82p0boMA@mail.gmail.com>
 <20180906133348.brzvqt53nzukn7n2@kili.mountain>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180906133348.brzvqt53nzukn7n2@kili.mountain>
Sender: linux-kernel-owner@vger.kernel.org
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Colin King <colin.king@canonical.com>
List-Id: linux-gpio@vger.kernel.org

On Thu, Sep 6, 2018 at 3:34 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:

> The problem is that if port == ARRAY_SIZE() and "gc == &epg->gc[port]"
> then that should be treated as invalid.
>
> Fixes: fd935fc421e7 ("gpio: ep93xx: Do not pingpong irq numbers")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Patch applied!

Yours,
Linus Walleij
