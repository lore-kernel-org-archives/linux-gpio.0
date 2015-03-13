From: Yingjoe Chen <yingjoe.chen@mediatek.com>
Subject: re: pinctrl: mediatek: emulate GPIO interrupt on both-edges
Date: Fri, 13 Mar 2015 21:48:38 +0800
Message-ID: <1426254518.16768.317.camel@mtksdaap41>
References: <20150313083824.GA5750@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mailgw02.mediatek.com ([210.61.82.184]:35185 "EHLO
	mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
	with ESMTP id S1751378AbbCMNsm (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 13 Mar 2015 09:48:42 -0400
In-Reply-To: <20150313083824.GA5750@mwanda>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: linux-gpio@vger.kernel.org, Axel Lin <axel.lin@ingics.com>

On Fri, 2015-03-13 at 11:38 +0300, Dan Carpenter wrote:
> Hello Yingjoe Chen,
> 
> The patch c3a785c1b041: "pinctrl: mediatek: emulate GPIO interrupt on
> both-edges" from Jan 27, 2015, leads to the following static checker
> warning:
> 
> 	drivers/pinctrl/mediatek/pinctrl-mtk-common.c:1252 mtk_pctrl_init()
> 	warn: passing devm_ allocated variable to kfree. 'pctl->eint_dual_edges'

Hi,

Thanks for catching this. It seems Axel already post a fix for me:

http://article.gmane.org/gmane.linux.kernel.gpio/6789

Joe.C


