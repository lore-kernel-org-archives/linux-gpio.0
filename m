From: Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH -next] pinctrl: nsp: fix potential NULL dereference in
 nsp_pinmux_probe()
Date: Wed, 11 Jul 2018 18:14:26 +0100
Message-ID: <15d64c26-f2c3-e3bb-2768-e5c9726cde49@arm.com>
References: <1531312461-134547-1-git-send-email-weiyongjun1@huawei.com>
 <7b4361a5-f757-179c-57b6-44359801baad@broadcom.com>
 <6c133df2-7dc7-d58b-297a-c27b87e7edd3@arm.com>
 <c0163341-1445-76e2-644f-22cab0735f82@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <c0163341-1445-76e2-644f-22cab0735f82@broadcom.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Ray Jui <ray.jui@broadcom.com>, Wei Yongjun <weiyongjun1@huawei.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Jon Mason <jonmason@broadcom.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, kernel-janitors@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Sudeep Holla <sudeep.holla@arm.com>
List-Id: linux-gpio@vger.kernel.org



On 11/07/18 18:11, Ray Jui wrote:
> 
> 

[...]

> 
> I meant there's a reason why xxx_resource was not used, which is most
> likely due to some resource conflict with another driver on NSP.
> 

Ah OK, sorry for the noise then.

-- 
Regards,
Sudeep
