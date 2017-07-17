From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH] pinctrl: zte: fix 'functions' allocation in
 zx_pinctrl_build_state()
Date: Mon, 17 Jul 2017 12:55:59 +0300
Message-ID: <20170717095559.oatvwvhnrzg2hd3m@mwanda>
References: <1500212008-29321-1-git-send-email-shawnguo@kernel.org>
 <20170717080221.gqf7xgeo2zqgigdq@mwanda>
 <20170717094622.GE3172@dragon>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20170717094622.GE3172@dragon>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Shawn Guo <shawnguo@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Baoyou Xie <xie.baoyou@sanechips.com.cn>, linux-gpio@vger.kernel.org, Xin Zhou <zhou.xin8@sanechips.com.cn>, Jun Nie <jun.nie@linaro.org>, Shawn Guo <shawn.guo@linaro.org>, linux-arm-kernel@lists.infradead.org
List-Id: linux-gpio@vger.kernel.org

On Mon, Jul 17, 2017 at 05:46:24PM +0800, Shawn Guo wrote:
> On Mon, Jul 17, 2017 at 11:02:21AM +0300, Dan Carpenter wrote:
> > Shouldn't there be a free if the remove function?  I'm not even sure
> > where the remove function is so I don't know.
> 
> As the pinctrl driver is essential for the platform, it's always a
> builtin_platform_driver which we do not even have a remove function.
> 

Ah.  Good deal, then.

regards,
dan carpenter
