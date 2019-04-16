From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH 5/5] pinctrl: zte: fix leaked of_node references
Date: Tue, 16 Apr 2019 13:56:09 +0800
Message-ID: <20190416055601.GB4690@X250.skyworth_vap>
References: <1555048943-39589-1-git-send-email-wen.yang99@zte.com.cn>
 <1555048943-39589-6-git-send-email-wen.yang99@zte.com.cn>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1555048943-39589-6-git-send-email-wen.yang99@zte.com.cn>
Sender: linux-kernel-owner@vger.kernel.org
To: Wen Yang <wen.yang99@zte.com.cn>
Cc: linux-kernel@vger.kernel.org, wang.yi59@zte.com.cn, Linus Walleij <linus.walleij@linaro.org>, Jun Nie <jun.nie@linaro.org>, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On Fri, Apr 12, 2019 at 02:02:23PM +0800, Wen Yang wrote:
> The call to of_parse_phandle returns a node pointer with refcount
> incremented thus it must be explicitly decremented after the last
> usage.
> 
> Detected by coccinelle with the following warnings:
> ./drivers/pinctrl/zte/pinctrl-zx.c:415:2-8: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 407, but without a corresponding object release within this function.
> ./drivers/pinctrl/zte/pinctrl-zx.c:422:2-8: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 407, but without a corresponding object release within this function.
> ./drivers/pinctrl/zte/pinctrl-zx.c:436:2-8: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 407, but without a corresponding object release within this function.
> ./drivers/pinctrl/zte/pinctrl-zx.c:444:2-8: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 407, but without a corresponding object release within this function.
> ./drivers/pinctrl/zte/pinctrl-zx.c:448:1-7: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 407, but without a corresponding object release within this function.
> 
> Signed-off-by: Wen Yang <wen.yang99@zte.com.cn>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Jun Nie <jun.nie@linaro.org>
> Cc: Shawn Guo <shawnguo@kernel.org>

Acked-by: Shawn Guo <shawnguo@kernel.org>
