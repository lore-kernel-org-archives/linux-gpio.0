From: Timur Tabi <timur@kernel.org>
Subject: Re: [PATCH v5 2/3] pinctrl: msm: Use init_valid_mask exported
 function
Date: Sun, 7 Oct 2018 08:03:41 -0500
Message-ID: <e57b6b66-a9f5-de6d-8876-0e3013b0ab40@kernel.org>
References: <20181005065300.22882-1-ricardo.ribalda@gmail.com>
 <20181005065300.22882-2-ricardo.ribalda@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181005065300.22882-2-ricardo.ribalda@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>, Jeffrey Hugo <jhugo@codeaurora.org>, Linus Walleij <linus.walleij@linaro.org>, Stephen Boyd <swboyd@chromium.org>, linux-gpio <linux-gpio@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On 10/5/18 1:52 AM, Ricardo Ribalda Delgado wrote:
> The current code produces XPU violation if get_direction is called just
> after the initialization.
> 
> Signed-off-by: Ricardo Ribalda Delgado<ricardo.ribalda@gmail.com>

I'm not the maintainer of pinctrl-msm, but this looks okay to me.

Acked-by: Timur Tabi <timur@kernel.org>
