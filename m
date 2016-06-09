From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v3 1/3] pinctrl/broxton: enable platform device in the
 absent of ACPI enumeration
Date: Thu, 9 Jun 2016 17:01:34 +0300
Message-ID: <20160609140134.GK1791@lahna.fi.intel.com>
References: <1465282553-28396-1-git-send-email-jui.nee.tan@intel.com>
 <1465282553-28396-2-git-send-email-jui.nee.tan@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga04.intel.com ([192.55.52.120]:39072 "EHLO mga04.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752144AbcFIOBs (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Thu, 9 Jun 2016 10:01:48 -0400
Content-Disposition: inline
In-Reply-To: <1465282553-28396-2-git-send-email-jui.nee.tan@intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Tan Jui Nee <jui.nee.tan@intel.com>
Cc: heikki.krogerus@linux.intel.com, andriy.shevchenko@linux.intel.com, tglx@linutronix.de, mingo@redhat.com, hpa@zytor.com, x86@kernel.org, ptyser@xes-inc.com, lee.jones@linaro.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, jonathan.yong@intel.com, ong.hock.yu@intel.com, weifeng.voon@intel.com, wan.ahmad.zainie.wan.mohamad@intel.com

On Tue, Jun 07, 2016 at 02:55:51PM +0800, Tan Jui Nee wrote:
> This is to cater the need for non-ACPI system whereby
> a platform device has to be created in order to bind
> with the Apollo Lake Pinctrl GPIO platform driver.
> 
> Signed-off-by: Tan Jui Nee <jui.nee.tan@intel.com>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
