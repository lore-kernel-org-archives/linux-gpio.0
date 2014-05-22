From: Gerhard Sittig <gsi@denx.de>
Subject: Re: [RFC PATCH 2/2] gpio-mpc8xxx: add mpc8xxx_gpio_set_multiple
 function
Date: Thu, 22 May 2014 18:54:18 +0200
Message-ID: <20140522165418.GP22644@book.gsilab.sittig.org>
References: <1883250.Le7v5oGnod@pcimr>
 <3728352.HA8JhAoUDB@pcimr>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.10]:33505 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753185AbaEVQyU (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 22 May 2014 12:54:20 -0400
Content-Disposition: inline
In-Reply-To: <3728352.HA8JhAoUDB@pcimr>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Rojhalat Ibrahim <imr@rtschenk.de>
Cc: linux-gpio@vger.kernel.org, Alexandre Courbot <gnurou@gmail.com>

On Wed, 2014-05-21 at 15:00 +0200, Rojhalat Ibrahim wrote:
> 
> This patch adds a set_multiple function to the MPC8xxx GPIO chip driver.
> It depends on my previous patch "gpiolib: allow simultaneous setting of
  ^^^^^^^^^^^^^

This information is relevant to review and pick up, but is not
appropriate for the commit message (which ends up in the mainline
repo where the condition does not apply).  I'd suggest to put it
into the comment section below the dashes line.


virtually yours
Gerhard Sittig
-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr. 5, D-82194 Groebenzell, Germany
Phone: +49-8142-66989-0 Fax: +49-8142-66989-80  Email: office@denx.de
