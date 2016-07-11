From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH -next] sh-pfc: Use PTR_ERR_OR_ZERO() to simplify the code
Date: Mon, 11 Jul 2016 09:52:39 +0200
Message-ID: <CACRpkdYZ9Q3AmpWognxHmqJ9X1VbhSLcn9+Oiq1Ja4pBZZtXiw@mail.gmail.com>
References: <1467806612-23904-1-git-send-email-weiyj_lk@163.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1467806612-23904-1-git-send-email-weiyj_lk@163.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: weiyj_lk@163.com
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Wei Yongjun <yongjun_wei@trendmicro.com.cn>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, Jul 6, 2016 at 2:03 PM,  <weiyj_lk@163.com> wrote:

> From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
>
> Use PTR_ERR_OR_ZERO rather than if(IS_ERR(...)) + PTR_ERR.
>
> Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>

Patch applied with Laurent's ACK.

(Not expecting Geert to collect patches for me this late in the merge
cycle.)

Yours,
Linus Walleij
