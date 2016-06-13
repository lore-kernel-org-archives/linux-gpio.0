From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v3 2/3] x86/platform/p2sb: New Primary to Sideband bridge
 support driver for Intel SOC's
Date: Mon, 13 Jun 2016 17:25:14 +0300
Message-ID: <20160613142514.GA1740@lahna.fi.intel.com>
References: <1465282553-28396-1-git-send-email-jui.nee.tan@intel.com>
 <1465282553-28396-3-git-send-email-jui.nee.tan@intel.com>
 <20160609140538.GL1791@lahna.fi.intel.com>
 <1465826071.30123.18.camel@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1465826071.30123.18.camel@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Tan Jui Nee <jui.nee.tan@intel.com>, heikki.krogerus@linux.intel.com, tglx@linutronix.de, mingo@redhat.com, hpa@zytor.com, x86@kernel.org, ptyser@xes-inc.com, lee.jones@linaro.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, jonathan.yong@intel.com, ong.hock.yu@intel.com, weifeng.voon@intel.com, wan.ahmad.zainie.wan.mohamad@intel.com
List-Id: linux-gpio@vger.kernel.org

On Mon, Jun 13, 2016 at 04:54:31PM +0300, Andy Shevchenko wrote:
> Would work to me, though still the same question: is it possible to
> avoid building it on even most of Intel platforms, since there, I
> assume, will be not many users of the module?

Well, even if you make it configurable via Kconfig, I guess distros will
have to enable it in order to support as wide range of CPUs as possible
in a single binary.
