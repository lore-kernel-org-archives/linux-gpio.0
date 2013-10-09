From: David Cohen <david.a.cohen@linux.intel.com>
Subject: Re: [PATCH 0/3] gpio-langwell: initial support for Intel Merrifield
Date: Wed, 09 Oct 2013 15:47:44 -0700
Message-ID: <5255DD10.1070201@linux.intel.com>
References: <1380916902-23791-1-git-send-email-david.a.cohen@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:57184 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753464Ab3JIWta (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Wed, 9 Oct 2013 18:49:30 -0400
In-Reply-To: <1380916902-23791-1-git-send-email-david.a.cohen@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org
Cc: David Cohen <david.a.cohen@linux.intel.com>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org

Hi Linus W,

On 10/04/2013 01:01 PM, David Cohen wrote:
> This patch set does initial support for Intel Merrifield and does non-function
> changes to make gpio-langwell more friendly to other Intel Mid SoC's.
>
> After these initial changes are accepted, more Merrifield stuff will come :)

Ping :)
Comments here?

Br, David Cohen

>
> David Cohen (3):
>    gpio: langwell: add Intel Merrifield support
>    gpio: rename gpio-langwell to gpio-intel-mid
>    gpio-intel-mid: update prefixes and names from langwell to intel-mid
>
>   drivers/gpio/Kconfig          |   6 +-
>   drivers/gpio/Makefile         |   2 +-
>   drivers/gpio/gpio-intel-mid.c | 471 ++++++++++++++++++++++++++++++++++++++++++
>   drivers/gpio/gpio-langwell.c  | 397 -----------------------------------
>   4 files changed, 475 insertions(+), 401 deletions(-)
>   create mode 100644 drivers/gpio/gpio-intel-mid.c
>   delete mode 100644 drivers/gpio/gpio-langwell.c
>

