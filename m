From: Michal Simek <michal.simek@xilinx.com>
Subject: Re: [PATCH 8/8] gpio: zynq: Fix driver function parameters alignment
Date: Mon, 14 Aug 2017 16:03:45 +0200
Message-ID: <7d741f71-2e7b-35b4-1c73-729896811b7e@xilinx.com>
References: <cover.1502103715.git.michal.simek@xilinx.com>
 <67e187a3dbc2ef8b6bacd1b173ae9e91c18aa429.1502103715.git.michal.simek@xilinx.com>
 <CACRpkdbMRgR3=dNpKJMC+vm=DPK6ay9bjMATtKLmxapvAkrTjw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdbMRgR3=dNpKJMC+vm=DPK6ay9bjMATtKLmxapvAkrTjw@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Michal Simek <michal.simek@xilinx.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "monstr@monstr.eu" <monstr@monstr.eu>, =?UTF-8?Q?S=c3=b6ren_Brinkmann?= <soren.brinkmann@xilinx.com>, Steffen Trumtrar <s.trumtrar@pengutronix.de>, Peter Crosthwaite <peter.crosthwaite@xilinx.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Rob Herring <robherring2@gmail.com>, Josh Cartwright <josh.cartwright@ni.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-gpio@vger.kernel.org

On 14.8.2017 16:01, Linus Walleij wrote:
> On Mon, Aug 7, 2017 at 1:02 PM, Michal Simek <michal.simek@xilinx.com> wrote:
> 
>> Fix function parameters alignment reported by checkpatch.
>>
>> Signed-off-by: Michal Simek <michal.simek@xilinx.com>
> 
> Patch applied.
> 
> Now you just need to rebase and figure out the two patches
> I had comments on.

Looking at that. That level one first and then the irq one.
This came from 3rd party that's why it will require some time to look at it.

Thanks,
Michal
