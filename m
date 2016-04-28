From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH v2] gpiolib-acpi: Duplicate con_id string when adding it
 to the crs lookup list
Date: Thu, 28 Apr 2016 20:55:36 +0900
Message-ID: <CAAVeFuLR0V2Vum0wTuHd+UZDwNaaF_V7H81xeX3TuzE-Obj=Wg@mail.gmail.com>
References: <1460563836-1899-1-git-send-email-ville.syrjala@linux.intel.com>
 <1461589279-8911-1-git-send-email-ville.syrjala@linux.intel.com>
 <CAAVeFuJKj_Z-s=K+Ag4XmzoL37vdz0MnBJiCoDYFk1NnZchrDw@mail.gmail.com> <20160428103333.GY4329@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20160428103333.GY4329@intel.com>
Sender: stable-owner@vger.kernel.org
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, Stable <stable@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, Apr 28, 2016 at 7:33 PM, Ville Syrj=C3=A4l=C3=A4
<ville.syrjala@linux.intel.com> wrote:
> On Thu, Apr 28, 2016 at 02:04:10PM +0900, Alexandre Courbot wrote:
>> On Mon, Apr 25, 2016 at 10:01 PM,  <ville.syrjala@linux.intel.com> w=
rote:
>> > From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>> >
>> > Calling gpiod_get() from a module and then unloading the module le=
ads to an
>> > oops due to acpi_can_fallback_to_crs() storing the pointer to the =
passed
>> > 'con_id' string onto acpi_crs_lookup_list. The next guy to come al=
ong will then
>> > try to access the string but the memory may now be gone with the m=
odule.
>> > Make a copy of the passed string instead, and store the copy on th=
e list.
>> >
>> > BUG: unable to handle kernel paging request at ffffffffa03e7855
>> > IP: [<ffffffff81338322>] strcmp+0x12/0x30
>> > PGD 2a07067 PUD 2a08063 PMD 74720067 PTE 0
>> > Oops: 0000 [#1] PREEMPT SMP
>> > Modules linked in: i915(+) drm_kms_helper drm intel_gtt snd_hda_co=
dec snd_hda_core i2c_algo_bit syscopya
>> > rea sysfillrect sysimgblt fb_sys_fops agpgart snd_soc_sst_bytcr_rt=
5640 coretemp hwmon intel_rapl intel_soc_dts_thermal
>> > punit_atom_debug snd_soc_rt5640 snd_soc_rl6231 serio snd_intel_sst=
_acpi snd_intel_sst_core video snd_soc_sst_mfld_platf
>> > orm snd_soc_sst_match backlight int3402_thermal processor_thermal_=
device int3403_thermal int3400_thermal acpi_thermal_r
>> > el snd_soc_core intel_soc_dts_iosf int340x_thermal_zone snd_compre=
ss i2c_hid hid snd_pcm snd_timer snd soundcore evdev
>> > sch_fq_codel efivarfs ipv6 autofs4 [last unloaded: drm]
>> > CPU: 2 PID: 3064 Comm: modprobe Tainted: G     U  W       4.6.0-rc=
3-ffrd-ipvr+ #302
>> > Hardware name: Intel Corp. VALLEYVIEW C0 PLATFORM/BYT-T FFD8, BIOS=
 BLAKFF81.X64.0088.R10.1403240443 FFD8
>> > _X64_R_2014_13_1_00 03/24/2014
>> > task: ffff8800701cd200 ti: ffff880070034000 task.ti: ffff880070034=
000
>> > RIP: 0010:[<ffffffff81338322>]  [<ffffffff81338322>] strcmp+0x12/0=
x30
>> > RSP: 0000:ffff880070037748  EFLAGS: 00010286
>> > RAX: 0000000080000000 RBX: ffff88007a342800 RCX: 0000000000000006
>> > RDX: 0000000000000006 RSI: ffffffffa054f856 RDI: ffffffffa03e7856
>> > RBP: ffff880070037748 R08: 0000000000000000 R09: 0000000000000001
>> > R10: 0000000000000000 R11: 0000000000000000 R12: ffffffffa054f855
>> > R13: ffff88007281cae0 R14: 0000000000000010 R15: ffffffffffffffea
>> > FS:  00007faa51447700(0000) GS:ffff880079300000(0000) knlGS:000000=
0000000000
>> > CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> > CR2: ffffffffa03e7855 CR3: 0000000041eba000 CR4: 00000000001006e0
>> > Stack:
>> >  ffff880070037770 ffffffff8136ad28 ffffffffa054f855 00000000000000=
00
>> >  ffff88007a0a2098 ffff8800700377e8 ffffffff8136852e ffff88007a3428=
00
>> >  00000007700377a0 ffff8800700377a0 ffffffff81412442 70672d6c656e61=
70
>> > Call Trace:
>> >  [<ffffffff8136ad28>] acpi_can_fallback_to_crs+0x88/0x100
>> >  [<ffffffff8136852e>] gpiod_get_index+0x25e/0x310
>> >  [<ffffffff81412442>] ? mipi_dsi_attach+0x22/0x30
>> >  [<ffffffff813685f2>] gpiod_get+0x12/0x20
>> >  [<ffffffffa04fcf41>] intel_dsi_init+0x421/0x480 [i915]
>> >  [<ffffffffa04d3783>] intel_modeset_init+0x853/0x16b0 [i915]
>> >  [<ffffffffa0504864>] ? intel_setup_gmbus+0x214/0x260 [i915]
>> >  [<ffffffffa0510158>] i915_driver_load+0xdc8/0x19b0 [i915]
>> >  [<ffffffff8160fb53>] ? _raw_spin_unlock_irqrestore+0x43/0x70
>> >  [<ffffffffa026b13b>] drm_dev_register+0xab/0xc0 [drm]
>> >  [<ffffffffa026d7b3>] drm_get_pci_dev+0x93/0x1f0 [drm]
>> >  [<ffffffff8160fb53>] ? _raw_spin_unlock_irqrestore+0x43/0x70
>> >  [<ffffffffa043f1f4>] i915_pci_probe+0x34/0x50 [i915]
>> >  [<ffffffff81379751>] pci_device_probe+0x91/0x100
>> >  [<ffffffff8141a75a>] driver_probe_device+0x20a/0x2d0
>> >  [<ffffffff8141a8be>] __driver_attach+0x9e/0xb0
>> >  [<ffffffff8141a820>] ? driver_probe_device+0x2d0/0x2d0
>> >  [<ffffffff81418439>] bus_for_each_dev+0x69/0xa0
>> >  [<ffffffff8141a04e>] driver_attach+0x1e/0x20
>> >  [<ffffffff81419c20>] bus_add_driver+0x1c0/0x240
>> >  [<ffffffff8141b6d0>] driver_register+0x60/0xe0
>> >  [<ffffffff81377d20>] __pci_register_driver+0x60/0x70
>> >  [<ffffffffa026d9f4>] drm_pci_init+0xe4/0x110 [drm]
>> >  [<ffffffff810ce04e>] ? trace_hardirqs_on+0xe/0x10
>> >  [<ffffffffa02f1000>] ? 0xffffffffa02f1000
>> >  [<ffffffffa02f1094>] i915_init+0x94/0x9b [i915]
>> >  [<ffffffff810003bb>] do_one_initcall+0x8b/0x1c0
>> >  [<ffffffff810eb616>] ? rcu_read_lock_sched_held+0x86/0x90
>> >  [<ffffffff811de6d6>] ? kmem_cache_alloc_trace+0x1f6/0x270
>> >  [<ffffffff81183826>] do_init_module+0x60/0x1dc
>> >  [<ffffffff81115a8d>] load_module+0x1d0d/0x2390
>> >  [<ffffffff811120b0>] ? __symbol_put+0x70/0x70
>> >  [<ffffffff811f41b2>] ? kernel_read_file+0x92/0x120
>> >  [<ffffffff811162f4>] SYSC_finit_module+0xa4/0xb0
>> >  [<ffffffff8111631e>] SyS_finit_module+0xe/0x10
>> >  [<ffffffff81001ff3>] do_syscall_64+0x63/0x350
>> >  [<ffffffff816103da>] entry_SYSCALL64_slow_path+0x25/0x25
>> > Code: f7 48 8d 76 01 48 8d 52 01 0f b6 4e ff 84 c9 88 4a ff 75 ed =
5d c3 0f 1f 00 55 48 89 e5 eb 04 84 c0
>> >  74 18 48 8d 7f 01 48 8d 76 01 <0f> b6 47 ff 3a 46 ff 74 eb 19 c0 =
83 c8 01 5d c3 31 c0 5d c3 66
>> > RIP  [<ffffffff81338322>] strcmp+0x12/0x30
>> >  RSP <ffff880070037748>
>> > CR2: ffffffffa03e7855
>> >
>> > v2: Make the copied con_id const
>> >
>> > Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
>> > Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
>> > Cc: Linus Walleij <linus.walleij@linaro.org>
>> > Cc: Alexandre Courbot <gnurou@gmail.com>
>> > Cc: stable@vger.kernel.org
>> > Fixes: 10cf4899f8af ("gpiolib: tighten up ACPI legacy gpio lookups=
")
>> > Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.=
com>
>> > ---
>> >  drivers/gpio/gpiolib-acpi.c | 2 +-
>> >  1 file changed, 1 insertion(+), 1 deletion(-)
>> >
>> > diff --git a/drivers/gpio/gpiolib-acpi.c b/drivers/gpio/gpiolib-ac=
pi.c
>> > index 682070d20f00..2dc52585e3f2 100644
>> > --- a/drivers/gpio/gpiolib-acpi.c
>> > +++ b/drivers/gpio/gpiolib-acpi.c
>> > @@ -977,7 +977,7 @@ bool acpi_can_fallback_to_crs(struct acpi_devi=
ce *adev, const char *con_id)
>> >                 lookup =3D kmalloc(sizeof(*lookup), GFP_KERNEL);
>> >                 if (lookup) {
>> >                         lookup->adev =3D adev;
>> > -                       lookup->con_id =3D con_id;
>> > +                       lookup->con_id =3D kstrdup(con_id, GFP_KER=
NEL);
>>
>> Agree with the idea, but where is this newly-allocated memory freed?
>
> It isn't. Neither is the 'lookup' thing itself.

Are we ok with that? Leaking memory is slightly better than crashing a
driver, but that is still not something to be fond of...
