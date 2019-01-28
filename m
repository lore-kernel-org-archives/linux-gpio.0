From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 0/2] pinctrl: remove unused 'pinconf-config' debugfs interface
Date: Mon, 28 Jan 2019 14:41:09 +0100
Message-ID: <CACRpkdYn2dtUK5UYR7a-omkhTxavH3DUAeh4KK1y2kedstx79g@mail.gmail.com>
References: <20190122211822.7016-1-vz@mleia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190122211822.7016-1-vz@mleia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vladimir Zapolskiy <vz@mleia.com>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Laurent Meunier <laurent.meunier@st.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Russell King <linux@arm.linux.org.uk>
List-Id: linux-gpio@vger.kernel.org

On Tue, Jan 22, 2019 at 10:18 PM Vladimir Zapolskiy <vz@mleia.com> wrote:

> The main goal of the change is to remove .pin_config_dbg_parse_modify
> callback before a driver with its support appears. So far the in-kernel
> interface did not attract any users since its introduction 5 years ago.

Good riddance. Both patches applied.
Thanks for noticing this and making the world
a better place by getting rid of this.

Yours,
Linus Walleij
