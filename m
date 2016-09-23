From: Michal Simek <michal.simek@xilinx.com>
Subject: Re: [PATCH v2] gpio: Added zynq specific check for special pins on
 bank zero
Date: Fri, 23 Sep 2016 12:50:12 +0200
Message-ID: <c6806094-9809-f488-34d3-d5294e9abe9b@xilinx.com>
References: <1474625137-9022-1-git-send-email-navam@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1474625137-9022-1-git-send-email-navam@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Nava kishore Manne <nava.manne@xilinx.com>, linus.walleij@linaro.org, gnurou@gmail.com, michal.simek@xilinx.com, soren.brinkmann@xilinx.com, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Nava kishore Manne <navam@xilinx.com>
List-Id: linux-gpio@vger.kernel.org

On 23.9.2016 12:05, Nava kishore Manne wrote:
> From: Nava kishore Manne <nava.manne@xilinx.com>
> 
> This patch adds zynq specific check for bank 0 pins 7 and 8
> are special and cannot be used as inputs
> 
> Signed-off-by: Nava kishore Manne <navam@xilinx.com>
> Acked-by: Michal Simek <michal.simek@xilinx.com>
> ---
> Changes for v2:
>                 -Removed un-used quirks for zynqmp.


You missed Soren's ACK and also Jonas reported by line.
Please add it to v3.

Thakns,
Michal
