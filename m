From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 1/5] gpio: syscon: allow fetching syscon from parent node
Date: Fri, 8 Jun 2018 09:54:58 +0200
Message-ID: <CACRpkdbye3-6WyuXW8AqttFLEKUK244xk0aNWSi_gsRhRzDrVg@mail.gmail.com>
References: <1527737273-8387-1-git-send-email-djw@t-chip.com.cn> <1527737273-8387-2-git-send-email-djw@t-chip.com.cn>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1527737273-8387-2-git-send-email-djw@t-chip.com.cn>
Sender: linux-kernel-owner@vger.kernel.org
To: Levin Du <djw@t-chip.com.cn>
Cc: "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, Wayne Chou <zxf@t-chip.com.cn>, Heiko Stuebner <heiko@sntech.de>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, May 31, 2018 at 5:27 AM,  <djw@t-chip.com.cn> wrote:

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

This patch has been sent upstream for v4.18.

Yours,
Linus Walleij
