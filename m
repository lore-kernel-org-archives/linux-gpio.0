From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 1/5] gpio: syscon: allow fetching syscon from parent node
Date: Wed, 23 May 2018 10:08:15 +0200
Message-ID: <CACRpkdYsDiTWL8MkWCP55ZnB8xoxcDFDEuuqA=Ov=opi-kyc1w@mail.gmail.com>
References: <1526614328-6869-1-git-send-email-djw@t-chip.com.cn> <1526615528-9707-1-git-send-email-djw@t-chip.com.cn>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1526615528-9707-1-git-send-email-djw@t-chip.com.cn>
Sender: linux-kernel-owner@vger.kernel.org
To: djw@t-chip.com.cn
Cc: "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, Wayne Chou <zxf@t-chip.com.cn>, Heiko Stuebner <heiko@sntech.de>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Fri, May 18, 2018 at 5:52 AM,  <djw@t-chip.com.cn> wrote:

> From: Heiko Stuebner <heiko@sntech.de>
>
> Syscon nodes can be a simple-mfd and the syscon-users then be declared
> as children of this node. That way the parent-child structure can be
> better represented for devices that are fully embedded in the syscon.
>
> Therefore allow getting the syscon from the parent if neither
> a special compatible nor a gpio,syscon-dev property is defined.
>
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> Signed-off-by: Levin Du <djw@t-chip.com.cn>
> ---
>
> Changes in v2: None
> Changes in v1:
> - New: allow fetching syscon from parent node in gpio-syscon driver

Regardless of what happens with the rest of the patches this
looks sane and generally useful, so patch applied!

Yours,
Linus Walleij
