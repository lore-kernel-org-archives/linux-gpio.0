From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [GIT PULL] Immutable branch between MFD, GPIO, Thermal and X86
 due for the v4.13 merge window
Date: Wed, 31 May 2017 07:50:33 +0100
Message-ID: <20170531065033.qkvphbjxg3chauoy@dell>
References: <20170523072615.r4widzjc6apwxpwb@dell>
 <75e12563a835dc4f8e8dab26ecea46822262604b.1495559980.git.sathyanarayanan.kuppuswamy@linux.intel.com>
 <20170530085306.s4hlijutbz7gp3ay@dell>
 <20170531133826.3bee86a0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-pm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170531133826.3bee86a0@canb.auug.org.au>
Sender: linux-pm-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: sathyanarayanan.kuppuswamy@linux.intel.com, gnurou@gmail.com, linus.walleij@linaro.org, edubezval@gmail.com, dvhart@infradead.org, rui.zhang@intel.com, andy@infradead.org, linux-gpio@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, sathyaosid@gmail.com
List-Id: linux-gpio@vger.kernel.org

On Wed, 31 May 2017, Stephen Rothwell wrote:

> Hi all,
> 
> On Tue, 30 May 2017 09:53:06 +0100 Lee Jones <lee.jones@linaro.org> wrote:
> >
> > Dear fellow Maintainers,
> > 
> > Enjoy!
> > 
> > The following changes since commit 2ea659a9ef488125eb46da6eb571de5eae5c43f6:
> > 
> >   Linux 4.12-rc1 (2017-05-13 13:19:49 -0700)
> > 
> > are available in the git repository at:
> > 
> >   git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git tags/ib-mfd-gpio-thermal-x86-v4.13
> > 
> > for you to fetch changes up to 6aa60f67c11c10540e43bbe5a6377f7a0231501e:
> > 
> >   platform: x86: intel_bxtwc_tmu: remove first level irq unmask (2017-05-30 09:34:08 +0100)
> > 
> > ----------------------------------------------------------------
> > Immutable branch between MFD, GPIO, Thermal and X86 due for the v4.13 merge window
> > 
> > ----------------------------------------------------------------
> > Kuppuswamy Sathyanarayanan (8):
> >       mfd: intel_soc_pmic_bxtwc: Use chained irqs for second level irq chips
> 
> See my other bug report on this commit ...

Thanks Stephen.

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
