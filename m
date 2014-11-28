From: Mika Westerberg <mika.westerberg@intel.com>
Subject: Re: [PATCHv4 1/3] gpio: sch: Consolidate similar algorithms
Date: Fri, 28 Nov 2014 12:54:58 +0200
Message-ID: <20141128105458.GQ1304@lahna.fi.intel.com>
References: <1416977280-27319-1-git-send-email-rebecca.swee.fun.chang@intel.com>
 <1416977280-27319-2-git-send-email-rebecca.swee.fun.chang@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1416977280-27319-2-git-send-email-rebecca.swee.fun.chang@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, GPIO Subsystem Mailing List <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Denis Turischev <denis.turischev@compulab.co.il>, Alexandre Courbot <gnurou@gmail.com>
List-Id: linux-gpio@vger.kernel.org

On Wed, Nov 26, 2014 at 12:47:58PM +0800, Chang Rebecca Swee Fun wrote:
> Consolidating similar algorithms into common functions to make
> GPIO SCH simpler and manageable.
>
> Signed-off-by: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>
> ---
>  drivers/gpio/gpio-sch.c |   81 ++++++++++++++++-------------------------------
>  1 file changed, 28 insertions(+), 53 deletions(-)

Looks good to me,

Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
