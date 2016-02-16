From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH] pinctrl: intel: Turn Baytrail support to tristate
Date: Tue, 16 Feb 2016 11:49:54 +0200
Message-ID: <20160216094954.GF1742@lahna.fi.intel.com>
References: <20160211120551.4d8224a4@endymion>
 <20160211112317.GT16826@lahna.fi.intel.com>
 <CACRpkdaBBeZbbZGduHOJKuqQmCdyXaMatFt97Bjxsbfdf6V3Rw@mail.gmail.com>
 <20160216085346.GA1742@lahna.fi.intel.com>
 <20160216101543.7602d9e8@endymion>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:58933 "EHLO mga01.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754415AbcBPJt6 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 16 Feb 2016 04:49:58 -0500
Content-Disposition: inline
In-Reply-To: <20160216101543.7602d9e8@endymion>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jean Delvare <jdelvare@suse.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Mathias Nyman <mathias.nyman@intel.com>

On Tue, Feb 16, 2016 at 10:15:43AM +0100, Jean Delvare wrote:
> Hi Mika, Linus,
> 
> On Tue, 16 Feb 2016 10:53:46 +0200, Mika Westerberg wrote:
> > On Tue, Feb 16, 2016 at 12:13:36AM +0100, Linus Walleij wrote:
> > > On Thu, Feb 11, 2016 at 12:23 PM, Mika Westerberg
> > > <mika.westerberg@linux.intel.com> wrote:
> > > > On Thu, Feb 11, 2016 at 12:05:51PM +0100, Jean Delvare wrote:
> > > >> The pinctrl-baytrail driver builds just fine as a module so give
> > > >> users this option.
> > > >
> > > > IIRC the reason why this is built-in is that there are all kind of ACPI
> > > > GPIO magic happening behind the scenes on Baytrail-T based machines
> > > > (such as Asus T100) and it does not work without the GPIO driver. Some
> > > > of the stuff is done pretty early too.
> > > 
> > > Hm I wonder if that could be the case for the AMD driver that just
> > > got tristated too...
> > 
> > If they use ACPI GPIO events and operation regions early at boot then it
> > can be the case.
> 
> TBH my patches were more RFCs or even wishful thinking than real
> patches. Sorry for not being clearer about this.
> 
> Hardware-specific code which can only be built-in is a problem, because
> it doesn't scale in the long run, so the pinctrl-baytrail and
> pinctrl-amd drivers as they exist today do not please me. Same for
> acpi_lpss and acpi_apd, btw... Hardware-specific code that is always
> built-in. If we keep doing that then distribution kernels will just
> grow and grow beyond reason.
> 
> So if there is any way to let this code be modularized, that would be
> great. At this point I still did not see the explanation as to why it
> can't be done. "All kind of ACPI GPIO magic happening behind the
> scenes" is not an explanation, that's something I would expect from the
> marketing department, not engineering ;-) I'd like to know what exactly
> is being done, how and why it technically can't be done after loading a
> module, it that's actually the case.

Like I said I remember there was some problems if the driver was not
loaded early enough. By ACPI GPIO magic I mean that there are things
like this for example in Asus T100:

        Device (GPO2)
        {
	    ...
            Method (_AEI, 0, NotSerialized)  // _AEI: ACPI Event Interrupts
            {
                Name (RBUF, ResourceTemplate ()
                {
                    GpioInt (Edge, ActiveLow, ExclusiveAndWake, PullUp, 0x0000,
                        "\\_SB.GPO2", 0x00, ResourceConsumer, ,
                        )
                        {   // Pin list
                            0x0006
                        }
                    GpioInt (Edge, ActiveLow, ExclusiveAndWake, PullUp, 0x0000,
                        "\\_SB.GPO2", 0x00, ResourceConsumer, ,
                        )
                        {   // Pin list
                            0x0012
                        }
                })
                Name (FBUF, ResourceTemplate ()
                {
                    GpioInt (Level, ActiveLow, ExclusiveAndWake, PullUp, 0x0000,
                        "\\_SB.GPO2", 0x00, ResourceConsumer, ,
                        )
                        {   // Pin list
                            0x0006
                        }
                    GpioInt (Level, ActiveLow, ExclusiveAndWake, PullUp, 0x0000,
                        "\\_SB.GPO2", 0x00, ResourceConsumer, ,
                        )
                        {   // Pin list
                            0x0012
                        }
                })
                If ((FSAS == One))
                {
                    Return (FBUF) /* \_SB_.GPO2._AEI.FBUF */
                }

                Return (RBUF) /* \_SB_.GPO2._AEI.RBUF */
            }

            Name (BFSA, Buffer (0x03)
            {
                 0x00, 0x01, 0x00                                 /* ... */
            })
            CreateByteField (BFSA, Zero, BYYY)
            CreateByteField (BFSA, 0x02, DATT)
            Name (BFSB, Buffer (0x03)
            {
                 0x00, 0x01, 0x00                                 /* ... */
            })
            CreateByteField (BFSB, Zero, YYYY)
            CreateByteField (BFSB, 0x02, DTTT)
            Method (_L06, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
            {
            }

            Name (BUFF, Buffer (0x07)
            {
                 0xFF                                             /* . */
            })
            CreateByteField (BUFF, Zero, STAT)
            CreateByteField (BUFF, One, LEN)
            CreateByteField (BUFF, 0x02, TMP0)
            CreateByteField (BUFF, 0x03, AX00)
            CreateByteField (BUFF, 0x04, AX01)
            CreateByteField (BUFF, 0x05, AX10)
            CreateByteField (BUFF, 0x06, AX11)
            Method (_L12, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
            {
                Local0 = Zero
                If (CondRefOf (\_SB.I2C1.BATC, Local1))
                {
                    Local0 = ^^I2C1.BATC.INTR ()
                    If ((0xFF == Local0))
                    {
                        ADBG ("INTR RD FAIL")
                        Return (Zero)
                    }

                    If ((Zero == Local0))
                    {
                        Return (Zero)
                    }

                    ADBG ("ULPMC INTR")
                    ADBG (Local0)
                    Notify (ADP1, 0x80) // Status Change
                    Notify (^^I2C1.BATC, 0x80) // Status Change
                    Notify (^^I2C1.BATC, 0x81) // Information Change
                }

                If ((Local0 == 0x0E))
                {
                    Notify (STR3, 0x90) // Device-Specific
                    If ((^^I2C1.AVBL == One))
                    {
                        BUFF = ^^I2C1.THRM /* \_SB_.I2C1.THRM */
                        If ((STAT == Zero))
                        {
                            Local4 = AX01 /* \_SB_.GPO2.AX01 */
                            Local4 &= 0xEF
                            Local5 = AX11 /* \_SB_.GPO2.AX11 */
                            Local5 &= 0xEF
                            AX01 = Local4
                            AX11 = Local5
                            ^^I2C1.THRM = BUFF /* \_SB_.GPO2.BUFF */
                        }
                    }
                }

                If (CondRefOf (\_SB.DPTF, Local3))
                {
                    If (((Local0 == One) || (Local0 == 0x02)))
                    {
                        Notify (DPTF, 0x86) // Device-Specific
                        Notify (TCHG, 0x80) // Status Change
                    }

                    If (((Local0 == 0x07) || (Local0 == 0x08)))
                    {
                        Notify (DPTF, 0x86) // Device-Specific
                        Notify (TCHG, 0x80) // Status Change
                    }
                }
            }

        }

The method _L12 is executed every time GPIO 12 is pulled low. Now, I'm
not exactly sure what this method does but it at least mentions BATC so
it might read battery status or something like that. If the GPIO
triggers early enough the event is missing. Not sure if this is going to
cause problems or not.

I'm not opposing turning this driver to a module. If it breaks things we
can always revert the patch ;-)
