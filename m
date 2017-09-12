From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] pinctrl: sprd: check for allocation failure
Date: Tue, 12 Sep 2017 11:27:08 +0200
Message-ID: <CACRpkdbezH6GcyZi8FgWhL-9zuDrrQJgfy+mhhvGQwLWr4kO0A@mail.gmail.com>
References: <20170907072926.56oqezwk4r72yjgt@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <kernel-janitors-owner@vger.kernel.org>
In-Reply-To: <20170907072926.56oqezwk4r72yjgt@mwanda>
Sender: kernel-janitors-owner@vger.kernel.org
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Baolin Wang <baolin.wang@spreadtrum.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, kernel-janitors@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On Thu, Sep 7, 2017 at 9:29 AM, Dan Carpenter <dan.carpenter@oracle.com> wrote:

> devm_pinctrl_get() could fail with ERR_PTR(-ENOMEM) so I have added a
> check for that.  I also reversed the other IS_ERR() test because it was
> a little confusing to test one way and then the opposite a couple lines
> later.
>
> Fixes: 41d32cfce1ae ("pinctrl: sprd: Add Spreadtrum pin control driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Patch applied for fixes.

Yours,
Linus Walleij
