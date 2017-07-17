From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH] pinctrl: zte: fix 'functions' allocation in
 zx_pinctrl_build_state()
Date: Mon, 17 Jul 2017 11:02:21 +0300
Message-ID: <20170717080221.gqf7xgeo2zqgigdq@mwanda>
References: <1500212008-29321-1-git-send-email-shawnguo@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1500212008-29321-1-git-send-email-shawnguo@kernel.org>
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

Shouldn't there be a free if the remove function?  I'm not even sure
where the remove function is so I don't know.

regards,
dan carpenter
