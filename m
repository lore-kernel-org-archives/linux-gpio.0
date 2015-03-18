From: Maxime Coquelin <maxime.coquelin@st.com>
Subject: Re: [STLinux Kernel] [PATCH 3/6] pinctrl: st: Move st_get_pio_control()
 further up the source file
Date: Wed, 18 Mar 2015 17:41:59 +0100
Message-ID: <5509AAD7.8030300@st.com>
References: <1426675899-19882-1-git-send-email-lee.jones@linaro.org> <1426675899-19882-4-git-send-email-lee.jones@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1426675899-19882-4-git-send-email-lee.jones@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linus.walleij@linaro.org, linux-gpio@vger.kernel.org
Cc: kernel@stlinux.com
List-Id: linux-gpio@vger.kernel.org



On 03/18/2015 11:51 AM, Lee Jones wrote:
> st_get_pio_control() will be used by subsequent calls which are
> to be located above its original position.  This is required to
> prevent the need for an unnecessary forward-declaration/prototype.
>
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>   drivers/pinctrl/pinctrl-st.c | 20 ++++++++++----------
>   1 file changed, 10 insertions(+), 10 deletions(-)
>
>

Acked-by: Maxime Coquelin <maxime.coquelin@st.com>

Thanks,
Maxime
