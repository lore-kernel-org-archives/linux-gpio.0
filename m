From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 0/3] pinctrl: cherryview: Extend the DMI quirk to
 Intel_Strago systems
Date: Tue, 23 May 2017 10:00:52 +0200
Message-ID: <CACRpkdb+TH9uNbUbKRrpyv7zVE2KVmJU3H3_+NOrzbh2DftsBg@mail.gmail.com>
References: <20170515110103.59765-1-mika.westerberg@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170515110103.59765-1-mika.westerberg@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Jean Delvare <jdelvare@suse.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Wei Yongjun <weiyongjun1@huawei.com>, bbaude@redhat.com, mildred-bug.kernel@mildred.fr, barnacs@justletit.be, lvuksta@gmail.com, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, May 15, 2017 at 1:01 PM, Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:

> It turned out that there are bunch of other Chromebooks that need the DMI
> quirk as well. Most of these are based on Intel_Strago reference design so
> we can identify them by using DMI_PRODUCT_FAMILY introduced in this series.
> The systems without the family string we add them separately.

I guess this is fixes material.

Who can ACK the firmware patch?

That subsystem seems to be weirdly floating between maintainers...

Andy generally seems to know what is going on with Intel
firmwares, so Andy can you ACK this patch set?

Jean Delvare's review would also be appreciated.

Yours,
Linus Walleij
