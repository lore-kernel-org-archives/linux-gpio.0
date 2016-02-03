From: Krzysztof Adamski <k@japko.eu>
Subject: Re: [PATCH v2 2/5] dts: sun8i-h3: Add APB0 related
 clocks and resets
Date: Thu, 4 Feb 2016 00:44:04 +0100
Message-ID: <20160203234403.GB12071@box2.japko.eu>
References: <1454448113-18810-1-git-send-email-k@japko.eu>
 <1454448113-18810-3-git-send-email-k@japko.eu>
 <20160203123534.GG4652@lukather>
 <20160203222117.GA12071@box2.japko.eu>
Reply-To: k@japko.eu
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Return-path: <linux-sunxi+bncBDIL57GUWIARBS5BZK2QKGQEKV5ETUI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160203222117.GA12071-xLeyfSbClftGit24Ens98Q@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Vishnu Patekar <vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jens Kuske <jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: linux-gpio@vger.kernel.org

On Wed, Feb 03, 2016 at 11:21:17PM +0100, Krzysztof Adamski wrote:
>On Wed, Feb 03, 2016 at 01:35:34PM +0100, Maxime Ripard wrote:
>>Hi,
>>
>>I'm not sure what you mean there. The fixed factor clocks only take a
>>single parent, and you provided two.
>
>True, I that's actually some stupid leftover. As mentioned in the 
>commit message I didn't really know how the clock tree looks like here 
>so I wanted to just pretend it's connectet to osc24M. After some 
>experiments I think that 0x01f0140c register does not exist on H3 and 
>I was finally (hopefully) able to understand how this clock is set up 
>in Allwinner's code. So I changed the clock to factors clock with 
>possible osc32k and osc24M parrents. Will send it in v3.

I've changed my mind about using factors clock. The clock I was thinking 
about is only setup for CIR peripheral and I have no information on how 
r_pio is clocked other than the fact it works by default so I assume 
it's clocked from 24M oscillator. New patchset send, let me know what 
you think.
