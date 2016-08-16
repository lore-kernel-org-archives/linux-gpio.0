From: Anisse Astier <anisse@astier.eu>
Subject: Re: [PATCH] pinctrl: cherryview: Do not mask all interrupts on probe
Date: Tue, 16 Aug 2016 18:12:40 +0200
Message-ID: <CALUN=qLAvUipcHArE_NT7Opv8iDjaZ3OTAsgs_jpXtBbvpwUXQ@mail.gmail.com>
References: <1432281368-88687-1-git-send-email-mika.westerberg@linux.intel.com>
 <20150601092348.GK1747@lahna.fi.intel.com> <CACRpkdbQpx4oas72PSVXkyxCv4Vz+3PTistDh7EKB126E0Q_GQ@mail.gmail.com>
 <20150602141520.GE4057@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150602141520.GE4057@lahna.fi.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Yu C Chen <yu.c.chen@intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

Hi Mika,

On Tue, Jun 2, 2015 at 4:15 PM, Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
> On Tue, Jun 02, 2015 at 03:53:40PM +0200, Linus Walleij wrote:
>> On Mon, Jun 1, 2015 at 11:23 AM, Mika Westerberg
>> <mika.westerberg@linux.intel.com> wrote:
>> > On Fri, May 22, 2015 at 10:56:08AM +0300, Mika Westerberg wrote:
>> >> BIOS/platform may use some of the pins by themselves, such as providing SCI
>> >> (System Control Interrupt) from the embedded controller. The driver masks
>> >> all interrupts at probe time which prevents those pins from triggering
>> >> interrupts properly.
>> >>
>> >> Fix this by not masking all interrupts at probe -- it should be enough just
>> >> to clear the status register.
>> >>
>> >> Reported-by: Yu C Chen <yu.c.chen@intel.com>
>> >> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
>> >
>> > Please ignore this patch for now. It turned out to be causing spurious
>> > interrupts on another platform.
>> >
>> > I'll need to rethink how to fix the reported issue.
>>
>> Looks like a case of "embed more magic knowledge" in the driver :/
>>
>> It needs to know what platform it is running on, and only leave specific
>> bits unmasked on these specific platforms. Right? Thereby
>> tossing all of the acpi_device_id matching and abstraction out
>> of the window.
>
> That's right.
>
> We still have few options left, like using ACPI _AEI (ACPI GPIO
> triggered events) for this or adding GPIO interrupt support directly to
> the EC driver.

Did you find a way to fix this issue ? I'm seeing a similar problem on a
laptop where this masks the interrupt used for ACPI events (brightness,
lid, battery).

Regards,

Anisse
