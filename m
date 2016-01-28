From: William Breathitt Gray <vilhelm.gray@gmail.com>
Subject: Re: [PATCH v5] gpio: Add GPIO support for the WinSystems WS16C48
Date: Thu, 28 Jan 2016 08:50:58 -0500
Message-ID: <20160128135058.GA16395@sophia>
References: <20160120184533.GA16632@sophia>
 <CACRpkdaMchsc9E-8JTMoKR6cFP9WEBTUrkPiQxqyrkGHXp-xWg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdaMchsc9E-8JTMoKR6cFP9WEBTUrkPiQxqyrkGHXp-xWg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, Jan 28, 2016 at 09:47:43AM +0100, Linus Walleij wrote:
>Out of curiosity: what is your usecase for all these exotic
>GPIO cards?

My motivated mainly by philosophy. Despite their popularity in the
embedded systems industry, there isn't much support in the baseline
kernel for PC/104 and other cards. Typically, when a user purchases one
of these devices, they receive some general drivers which serve more as
proof that the device is working rather than as practical driver.

The user is lucky if they receive Linux drivers rather than just the
usual Windows drivers. Even if Linux drivers are provided, the drivers
are often written for ancient kernel versions (e.g. version 2.4), and
implement some custom character device structure rather than utilize the
Linux device model.

I'm writing these drivers to help bring support for these devices to the
baseline Linux kernel, in the hopes that it will be useful to someone,
and perhaps even motivate the companies to improve and share their own
Linux drivers.

William Breathitt Gray
