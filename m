From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [patch] gpiolib: potential oops on failure path
Date: Sat, 18 Jun 2016 10:57:31 +0200
Message-ID: <CACRpkdZB22aKoui-5t7h61k4JmLh9nShgcQUmc2LrGv490uGxA@mail.gmail.com>
References: <20160617091550.GB25609@mwanda> <CACRpkdbYYyH805OGa-gkWkj0+JiApKo-kND=h1Oaycd86EcLRw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <kernel-janitors-owner@vger.kernel.org>
In-Reply-To: <CACRpkdbYYyH805OGa-gkWkj0+JiApKo-kND=h1Oaycd86EcLRw@mail.gmail.com>
Sender: kernel-janitors-owner@vger.kernel.org
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, kernel-janitors@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On Sat, Jun 18, 2016 at 10:52 AM, Linus Walleij
<linus.walleij@linaro.org> wrote:
> On Fri, Jun 17, 2016 at 11:15 AM, Dan Carpenter
> <dan.carpenter@oracle.com> wrote:
>
>> If anon_inode_getfd() fails then "i" is set to GPIOHANDLES_MAX.  It
>> means that we will read beyond the end of the array and dereference an
>> invalid pointer.
>>
>> Fixes: d7c51b47ac11 ('gpio: userspace ABI for reading/writing GPIO lines')
>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> Ouch, yeah that happens when you request max number of handles, thanks.
>
> Patch applied.

Ah no, I saw the real problem now. Sending another patch.

Yours,
Linus Walleij
