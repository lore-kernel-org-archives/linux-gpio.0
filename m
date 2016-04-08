From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] gpio: pca953x: add PCAL9535 interrupt support for
 Galileo Gen2
Date: Fri, 8 Apr 2016 15:20:52 +0200
Message-ID: <CACRpkdavpaV1K7hfWgyRTtnxmFqkrD33--Ji9jcy_JFwqYYX7Q@mail.gmail.com>
References: <1460004992-16210-1-git-send-email-yong.b.li@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1460004992-16210-1-git-send-email-yong.b.li@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yong Li <yong.b.li@intel.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, "Puustinen, Ismo" <ismo.puustinen@intel.com>, Phil Reid <preid@electromag.com.au>
List-Id: linux-gpio@vger.kernel.org

n Thu, Apr 7, 2016 at 6:56 AM, Yong Li <yong.b.li@intel.com> wrote:

> Galileo Gen2 board uses the PCAL9535 as the GPIO expansion,
> it is different from PCA9535 and includes interrupt mask/status registers,
> The current driver does not support the interrupt registers configuration,
> it causes some gpio pins cannot trigger interrupt events,
> this patch fix this issue. The original patch was submitted by
> Josef Ahmad <josef.ahmad@linux.intel.com>
> http://git.yoctoproject.org/cgit/cgit.cgi/meta-intel-quark/tree/recipes-kernel/linux/files/0015-Quark-GPIO-1-2-quark.patch
>
> Signed-off-by: Yong Li <yong.b.li@intel.com>

Patch applied with Andy's review tag.

Yours,
Linus Walleij
