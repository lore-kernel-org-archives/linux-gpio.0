From: "Robert P. J. Day" <rpjday@crashcourse.ca>
Subject: Re: [PATCH 5/7] gpio: use class_groups instead of class_attrs
Date: Thu, 8 Jun 2017 04:23:38 -0400 (EDT)
Message-ID: <alpine.LFD.2.20.1706080423040.27226@localhost.localdomain>
References: <20170608081242.27061-1-gregkh@linuxfoundation.org> <20170608081242.27061-6-gregkh@linuxfoundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from cpanel2.indieserve.net ([199.212.143.6]:57388 "EHLO
        cpanel2.indieserve.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751608AbdFHIXm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 8 Jun 2017 04:23:42 -0400
In-Reply-To: <20170608081242.27061-6-gregkh@linuxfoundation.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org

On Thu, 8 Jun 2017, Greg Kroah-Hartman wrote:

> The class_attrs pointer is long depreciated, and is about to be finally
                                  ^^^^^^^^^^^ deprecated

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================
