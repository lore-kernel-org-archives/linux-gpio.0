From: Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH v2] Documentation: gpio: Update ACPI part of the
 document to mention _DSD
Date: Sat, 4 Apr 2015 11:27:57 +0200
Message-ID: <20150404112757.04d9f5fd@lwn.net>
References: <1427875996-216926-1-git-send-email-mika.westerberg@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Return-path: <linux-acpi-owner@vger.kernel.org>
In-Reply-To: <1427875996-216926-1-git-send-email-mika.westerberg@linux.intel.com>
Sender: linux-acpi-owner@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Darren Hart <dvhart@linux.intel.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On Wed,  1 Apr 2015 11:13:16 +0300
Mika Westerberg <mika.westerberg@linux.intel.com> wrote:

> With ACPI 5.1 _DSD (Device Specific Data) it is now possible to name
> functions just like Device Tree is doing. Make sure that the documentation
> mentions _DSD as the recommended way to describe GPIOs in ACPI systems.

OK, I've applied this to the docs tree, thanks.

jon
