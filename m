From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH] pinctrl: sh-pfc: r8a7794: swap ATA signals
Date: Tue, 4 Apr 2017 23:22:03 +0300
Message-ID: <d3c8c307-934e-511d-486f-0d5ced2e54c5@cogentembedded.com>
References: <20170404202025.306556752@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <20170404202025.306556752@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On 04/04/2017 11:20 PM, Sergei Shtylyov wrote:

> All R8A7794 manuals  I have here (0.50 and 1.10) agree that the PFC driver
> has ATAG0#  and ATAWR# signals in IPSR12 swapped -- fix this.

    Oops, ATAWR0#. Do I need to resend?

> Fixes: 43c4436e2f18 ("pinctrl: sh-pfc: add R8A7794 PFC support")
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
[...]

MBR, Sergei
