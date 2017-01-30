From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] gpio: mcp23s08: use regmap
Date: Mon, 30 Jan 2017 15:58:59 +0100
Message-ID: <CACRpkdar1cCVOTzxjH5u9L=-gqX107hAcP1GLqzVZ2fG-2k7+Q@mail.gmail.com>
References: <20170127144738.21107-1-sre@kernel.org> <20170127144738.21107-2-sre@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170127144738.21107-2-sre@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sebastian Reichel <sre@kernel.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Fri, Jan 27, 2017 at 3:47 PM, Sebastian Reichel <sre@kernel.org> wrote:

> Use regmap API to save some lines of codes and have
> debugfs support for all of the MCP's registers.
>
> Signed-off-by: Sebastian Reichel <sre@kernel.org>

Patch applied. Irresistible cleanup!

Yours,
Linus Walleij
