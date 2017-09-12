From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] pinctrl: sprd: fix off by one bugs
Date: Tue, 12 Sep 2017 11:28:19 +0200
Message-ID: <CACRpkdY61cYzLJyZpwcN1sp_gby=szYRA4ZuCCWvRgitrDxORg@mail.gmail.com>
References: <20170907072926.56oqezwk4r72yjgt@mwanda> <20170907073211.zgcgmdfrphtqy3d7@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <kernel-janitors-owner@vger.kernel.org>
In-Reply-To: <20170907073211.zgcgmdfrphtqy3d7@mwanda>
Sender: kernel-janitors-owner@vger.kernel.org
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Baolin Wang <baolin.wang@spreadtrum.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, kernel-janitors@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On Thu, Sep 7, 2017 at 1:12 PM, Dan Carpenter <dan.carpenter@oracle.com> wrote:

> info->groups[] has info->ngroups elements so these comparisons should be
>>= instead of >.
>
> Fixes: 41d32cfce1ae ("pinctrl: sprd: Add Spreadtrum pin control driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Patch applied with Baolin's review tag.

Yours,
Linus Walleij
