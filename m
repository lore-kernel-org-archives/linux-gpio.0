From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v3 2/4] gpiolib: add gpiod_get_array and gpiod_put_array
 functions
Date: Tue, 10 Feb 2015 14:41:18 +0200
Message-ID: <20150210124118.GA29259@lahna.fi.intel.com>
References: <5520672.Jf0M3ih51r@pcimr>
 <20150210104034.GP1480@lahna.fi.intel.com>
 <74928007.UMhZGNk44t@pcimr>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:3394 "EHLO mga02.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755168AbbBJMlX (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 10 Feb 2015 07:41:23 -0500
Content-Disposition: inline
In-Reply-To: <74928007.UMhZGNk44t@pcimr>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Rojhalat Ibrahim <imr@rtschenk.de>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Alexandre Courbot <acourbot@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>

On Tue, Feb 10, 2015 at 01:21:19PM +0100, Rojhalat Ibrahim wrote:
> On Tuesday 10 February 2015 12:40:34 Mika Westerberg wrote:
> > [+Rafael]
> >=20
> > On Mon, Feb 09, 2015 at 06:07:10PM +0100, Rojhalat Ibrahim wrote:
> > > Introduce new functions for conveniently obtaining and disposing =
of an entire
> > > array of GPIOs with one function call.
> > >=20
> > > Suggested-by: Alexandre Courbot <acourbot@nvidia.com>
> > > Signed-off-by: Rojhalat Ibrahim <imr@rtschenk.de>
> >=20
> > Can you please next time CC me the whole series? Now it fails with:
> >=20
>=20
> Sure. Sorry about that.
>=20
> > drivers/gpio/gpiolib.c: In function =E2=80=98dt_gpio_count=E2=80=99=
:
> > drivers/gpio/gpiolib.c:1812:29: error: =E2=80=98gpio_suffixes=E2=80=
=99 undeclared (first
> > use in this function)
> >   for (i =3D 0; i < ARRAY_SIZE(gpio_suffixes); i++) {
> >                              ^
> > include/linux/kernel.h:54:33: note: in definition of macro =E2=80=98=
ARRAY_SIZE=E2=80=99
> >  #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) +
> > __must_be_array(arr))
> >=20
> > and so on.
> >=20
> > > ---
> > > Change log:
> > >   v3: - rebase on current linux-gpio devel branch
> > >       - fix ACPI GPIO counting
> > >       - allow for zero-sized arrays
> > >       - make the flags argument mandatory for the new functions
> > >       - clarify documentation
> > >   v2: change interface
> > >=20
> > >  Documentation/gpio/consumer.txt |  33 +++++-
> > >  drivers/gpio/gpiolib.c          | 231 ++++++++++++++++++++++++++=
++++++++++++++
> > >  include/linux/gpio/consumer.h   |  46 ++++++++
> > >  3 files changed, 307 insertions(+), 3 deletions(-)
> > >=20
> > > diff --git a/Documentation/gpio/consumer.txt b/Documentation/gpio=
/consumer.txt
> > > index d85fbae..85a7e30 100644
> > > --- a/Documentation/gpio/consumer.txt
> > > +++ b/Documentation/gpio/consumer.txt
> > > @@ -58,7 +58,6 @@ pattern where a GPIO is optional, the gpiod_get=
_optional() and
> > >  gpiod_get_index_optional() functions can be used. These function=
s return NULL
> > >  instead of -ENOENT if no GPIO has been assigned to the requested=
 function:
> > > =20
> > > -
> > >  	struct gpio_desc *gpiod_get_optional(struct device *dev,
> > >  					     const char *con_id,
> > >  					     enum gpiod_flags flags)
> > > @@ -68,6 +67,27 @@ instead of -ENOENT if no GPIO has been assigne=
d to the requested function:
> > >  						   unsigned int index,
> > >  						   enum gpiod_flags flags)
> > > =20
> > > +For a function using multiple GPIOs all of those can be obtained=
 with one call:
> > > +
> > > +	struct gpio_descs *gpiod_get_array(struct device *dev,
> > > +					   const char *con_id,
> > > +					   enum gpiod_flags flags)
> > > +
> > > +This function returns a struct gpio_descs which contains an arra=
y of
> > > +descriptors:
> > > +
> > > +	struct gpio_descs {
> > > +		unsigned int array_size;
> > > +		struct gpio_desc *desc_array[];
> > > +	}
> > > +
> > > +The following function returns NULL instead of -ENOENT if no GPI=
Os have been
> > > +assigned to the requested function:
> > > +
> > > +	struct gpio_descs *gpiod_get_array_optional(struct device *dev,
> > > +						    const char *con_id,
> > > +						    enum gpiod_flags flags)
> > > +
> > >  Device-managed variants of these functions are also defined:
> > > =20
> > >  	struct gpio_desc *devm_gpiod_get(struct device *dev, const char=
 *con_id,
> > > @@ -91,8 +111,15 @@ A GPIO descriptor can be disposed of using th=
e gpiod_put() function:
> > > =20
> > >  	void gpiod_put(struct gpio_desc *desc)
> > > =20
> > > -It is strictly forbidden to use a descriptor after calling this =
function. The
> > > -device-managed variant is, unsurprisingly:
> > > +For an array of GPIOs this function can be used:
> > > +
> > > +	void gpiod_put_array(struct gpio_descs *descs)
> > > +
> > > +It is strictly forbidden to use a descriptor after calling these=
 functions.
> > > +It is also not allowed to individually release descriptors (usin=
g gpiod_put())
> > > +from an array acquired with gpiod_get_array().
> > > +
> > > +The device-managed variant is, unsurprisingly:
> > > =20
> > >  	void devm_gpiod_put(struct device *dev, struct gpio_desc *desc)
> > > =20
> > > diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> > > index ff2b80d..d4153e0 100644
> > > --- a/drivers/gpio/gpiolib.c
> > > +++ b/drivers/gpio/gpiolib.c
> > > @@ -1804,6 +1804,158 @@ static struct gpio_desc *gpiod_find(struc=
t device *dev, const char *con_id,
> > >  	return desc;
> > >  }
> > > =20
> > > +static int dt_gpio_count(struct device *dev, const char *con_id)
> > > +{
> > > +	int ret;
> > > +	char propname[32];
> > > +	unsigned int i;
> > > +
> > > +	for (i =3D 0; i < ARRAY_SIZE(gpio_suffixes); i++) {
> > > +		if (con_id)
> > > +			snprintf(propname, sizeof(propname), "%s-%s",
> > > +				 con_id, gpio_suffixes[i]);
> > > +		else
> > > +			snprintf(propname, sizeof(propname), "%s",
> > > +				 gpio_suffixes[i]);
> > > +
> > > +		ret =3D of_gpio_named_count(dev->of_node, propname);
> > > +		if (ret >=3D 0)
> > > +			break;
> > > +	}
> > > +	return ret;
> > > +}
> > > +
> > > +#ifdef CONFIG_ACPI
> > > +
> > > +static unsigned int acpi_gpio_package_count(const union acpi_obj=
ect *obj)
> > > +{
> > > +	const union acpi_object *element =3D obj->package.elements;
> > > +	const union acpi_object *end =3D element + obj->package.count;
> > > +	unsigned int count =3D 0;
> > > +
> > > +	while (element < end) {
> > > +		if (element->type =3D=3D ACPI_TYPE_LOCAL_REFERENCE)
> > > +			count++;
> > > +
> > > +		element++;
> > > +	}
> > > +	return count;
> > > +}
> > > +
> > > +static int acpi_find_gpio_count(struct acpi_resource *ares, void=
 *data)
> > > +{
> > > +	unsigned int *count =3D data;
> > > +
> > > +	if (ares->type =3D=3D ACPI_RESOURCE_TYPE_GPIO)
> > > +		*count +=3D ares->data.gpio.pin_table_length;
> > > +
> > > +	return 1;
> > > +}
> > > +
> > > +static int acpi_gpio_count(struct device *dev, const char *con_i=
d)
> > > +{
> > > +	struct acpi_device *adev =3D ACPI_COMPANION(dev);
> >=20
> > Should you check that the ACPI companion device actually exists her=
e or
> > is it checked somewhere before already?
> >=20
> > > +	const union acpi_object *obj;
> > > +	const struct acpi_gpio_mapping *gm;
> > > +	int count =3D -ENOENT;
> > > +	int ret;
> > > +	char propname[32];
> > > +	unsigned int i;
> > > +
> > > +	/* Try first from _DSD */
> > > +	for (i =3D 0; i < ARRAY_SIZE(gpio_suffixes); i++) {
> > > +		if (con_id && strcmp(con_id, "gpios"))
> > > +			snprintf(propname, sizeof(propname), "%s-%s",
> > > +				 con_id, gpio_suffixes[i]);
> >=20
> > I'm assuming some previous patch added gpio_suffixes[].
> >=20
> > > +		else
> > > +			snprintf(propname, sizeof(propname), "%s",
> > > +				 gpio_suffixes[i]);
> > > +
> > > +		ret =3D acpi_dev_get_property(adev, propname, ACPI_TYPE_ANY,
> > > +					    &obj);
> > > +		if (ret =3D=3D 0) {
> > > +			if (obj->type =3D=3D ACPI_TYPE_LOCAL_REFERENCE)
> > > +				count =3D 1;
> > > +			else if (obj->type =3D=3D ACPI_TYPE_PACKAGE)
> > > +				count =3D acpi_gpio_package_count(obj);
> > > +		} else if (adev->driver_gpios) {
> > > +			for (gm =3D adev->driver_gpios; gm->name; gm++)
> > > +				if (strcmp(propname, gm->name) =3D=3D 0) {
> > > +					count =3D gm->size;
> > > +					break;
> > > +				}
> > > +		}
> > > +		if (count >=3D 0)
> > > +			break;
> > > +	}
> > > +
> > > +	/* Then from plain _CRS GPIOs */
> > > +	if (count < 0) {
> > > +		struct list_head resource_list;
> > > +		unsigned int crs_count =3D 0;
> > > +
> > > +		INIT_LIST_HEAD(&resource_list);
> > > +		acpi_dev_get_resources(adev, &resource_list,
> > > +				       acpi_find_gpio_count, &crs_count);
> > > +		acpi_dev_free_resource_list(&resource_list);
> > > +		if (crs_count > 0)
> > > +			count =3D crs_count;
> > > +	}
> > > +	return count;
> > > +}
> >=20
> > Otherwise the ACPI parts look good to me. I still want to test this=
,
> > though.
> >=20
>=20
> Great.
>=20
> > > +
> > > +#else
> > > +
> > > +static int acpi_gpio_count(struct device *dev, const char *con_i=
d)
> > > +{
> > > +	return -ENODEV;
> > > +}
> > > +
> > > +#endif
> > > +
> > > +static int lut_gpio_count(struct device *dev, const char *con_id=
)
> > > +{
> > > +	struct gpiod_lookup_table *table;
> > > +	struct gpiod_lookup *p;
> > > +	unsigned int count =3D 0;
> > > +
> > > +	table =3D gpiod_find_lookup_table(dev);
> > > +	if (!table)
> > > +		return -ENOENT;
> > > +
> > > +	for (p =3D &table->table[0]; p->chip_label; p++) {
> > > +		if ((con_id && p->con_id && !strcmp(con_id, p->con_id)) ||
> > > +		    (!con_id && !p->con_id))
> > > +			count++;
> > > +	}
> > > +	if (!count)
> > > +		return -ENOENT;
> > > +
> > > +	return count;
> > > +}
> > > +
> > > +/**
> > > + * gpiod_count - return the number of GPIOs associated with a de=
vice / function
> > > + *		or -ENOENT if no GPIO has been assigned to the requested fun=
ction
> > > + * @dev:	GPIO consumer, can be NULL for system-global GPIOs
> > > + * @con_id:	function within the GPIO consumer
> > > + */
> > > +int gpiod_count(struct device *dev, const char *con_id)
> > > +{
> > > +	int count =3D -ENOENT;
> > > +
> > > +	if (IS_ENABLED(CONFIG_OF) && dev && dev->of_node)
> > > +		count =3D dt_gpio_count(dev, con_id);
> > > +	else if (IS_ENABLED(CONFIG_ACPI) && dev && ACPI_HANDLE(dev))
> > > +		count =3D acpi_gpio_count(dev, con_id);
> >=20
> > Aha, so you here you checked for the ACPI compation, all right then=
=2E
> >=20
> > > +
> > > +	if (count < 0)
> > > +		count =3D lut_gpio_count(dev, con_id);
> > > +
> > > +	return count;
> > > +}
> > > +EXPORT_SYMBOL_GPL(gpiod_count);
> > > +
> > >  /**
> > >   * gpiod_get - obtain a GPIO for a given GPIO function
> > >   * @dev:	GPIO consumer, can be NULL for system-global GPIOs
> > > @@ -2005,6 +2157,70 @@ struct gpio_desc *__must_check __gpiod_get=
_index_optional(struct device *dev,
> > >  EXPORT_SYMBOL_GPL(__gpiod_get_index_optional);
> > > =20
> > >  /**
> > > + * gpiod_get_array - obtain multiple GPIOs from a multi-index GP=
IO function
> > > + * @dev:	GPIO consumer, can be NULL for system-global GPIOs
> > > + * @con_id:	function within the GPIO consumer
> > > + * @flags:	optional GPIO initialization flags
> > > + *
> > > + * This function acquires all the GPIOs defined under a given fu=
nction.
> > > + *
> > > + * Return a struct gpio_descs containing an array of descriptors=
, -ENOENT if
> > > + * no GPIO has been assigned to the requested function, or anoth=
er IS_ERR()
> > > + * code if an error occurred while trying to acquire the GPIOs.
> > > + */
> > > +struct gpio_descs *__must_check gpiod_get_array(struct device *d=
ev,
> > > +						const char *con_id,
> > > +						enum gpiod_flags flags)
> > > +{
> > > +	struct gpio_desc *desc;
> > > +	struct gpio_descs *descs;
> > > +	int count;
> > > +
> > > +	count =3D gpiod_count(dev, con_id);
> > > +	if (count < 0)
> > > +		return ERR_PTR(count);
> > > +
> > > +	descs =3D kzalloc(sizeof(*descs) + sizeof(descs->desc_array[0])=
 * count,
> > > +			GFP_KERNEL);
> >=20
> > Should you return ERR_PTR(-ENOMEM) here if the allocation fails?
> >=20
>=20
> Of course. I'll put it in the next revision.
>=20
> > > +
> > > +	for (descs->array_size =3D 0; descs->array_size < count; ) {
> >                                                               ^
> >                                                               |
> >                                                               +-- e=
xtra whitespace
> >=20
> > > +		desc =3D gpiod_get_index(dev, con_id, descs->array_size, flags=
);
> > > +		if (IS_ERR(desc)) {
> > > +			gpiod_put_array(descs);
> > > +			return ERR_PTR(PTR_ERR(desc));
> >=20
> > Uh, why not
> >=20
> > 	return desc
> >=20
> > ?
>=20
> Because of the different pointer type. desc is a pointer to a GPIO de=
scriptor
> whereas the return type of the function is a pointer to struct gpio_d=
escs.

Right. I wonder if ERR_CAST() may be used here.

>=20
> >=20
> > > +		}
> > > +		descs->desc_array[descs->array_size] =3D desc;
> > > +		descs->array_size++;
> > > +	}
> > > +	return descs;
> > > +}
> > > +EXPORT_SYMBOL_GPL(gpiod_get_array);
> > > +
> > > +/**
> > > + * gpiod_get_array_optional - obtain multiple GPIOs from a multi=
-index GPIO
> > > + *                            function
> > > + * @dev:	GPIO consumer, can be NULL for system-global GPIOs
> > > + * @con_id:	function within the GPIO consumer
> > > + * @flags:	optional GPIO initialization flags
> > > + *
> > > + * This is equivalent to gpiod_get_array(), except that when no =
GPIO was
> > > + * assigned to the requested function it will return NULL.
> > > + */
> > > +struct gpio_descs *__must_check gpiod_get_array_optional(struct =
device *dev,
> > > +							const char *con_id,
> > > +							enum gpiod_flags flags)
> > > +{
> > > +	struct gpio_descs *descs;
> > > +
> > > +	descs =3D gpiod_get_array(dev, con_id, flags);
> > > +	if (IS_ERR(descs) && (PTR_ERR(descs) =3D=3D -ENOENT))
> > > +		return NULL;
> >=20
> > The caller still needs to handle other error codes (than -ENOENT), =
so
> > would it be better to just have only gpiod_get_array()?
> >=20
>=20
> This follows the same pattern as gpiod_get_optional() and
> gpiod_get_index_optional()
>=20
> >From Documentation/gpio/consumer.txt:
>=20
> This is useful to discriminate between mere
> errors and an absence of GPIO for optional GPIO parameters. For the c=
ommon
> pattern where a GPIO is optional, the gpiod_get_optional() and
> gpiod_get_index_optional() functions can be used. These functions ret=
urn NULL
> instead of -ENOENT if no GPIO has been assigned to the requested func=
tion

=46air enough.

> > > +
> > > +	return descs;
> > > +}
> > > +EXPORT_SYMBOL_GPL(gpiod_get_array_optional);
> > > +
> > > +/**
> > >   * gpiod_put - dispose of a GPIO descriptor
> > >   * @desc:	GPIO descriptor to dispose of
> > >   *
> > > @@ -2016,6 +2232,21 @@ void gpiod_put(struct gpio_desc *desc)
> > >  }
> > >  EXPORT_SYMBOL_GPL(gpiod_put);
> > > =20
> > > +/**
> > > + * gpiod_put_array - dispose of multiple GPIO descriptors
> > > + * @descs:	struct gpio_descs containing an array of descriptors
> > > + */
> > > +void gpiod_put_array(struct gpio_descs *descs)
> > > +{
> > > +	unsigned int i;
> > > +
> > > +	for (i =3D 0; i < descs->array_size; i++)
> > > +		gpiod_put(descs->desc_array[i]);
> > > +
> > > +	kfree(descs);
> > > +}
> > > +EXPORT_SYMBOL_GPL(gpiod_put_array);
> > > +
> > >  #ifdef CONFIG_DEBUG_FS
> > > =20
> > >  static void gpiolib_dbg_show(struct seq_file *s, struct gpio_chi=
p *chip)
> > > diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/c=
onsumer.h
> > > index 45afc2d..6b1c389 100644
> > > --- a/include/linux/gpio/consumer.h
> > > +++ b/include/linux/gpio/consumer.h
> > > @@ -16,6 +16,15 @@ struct device;
> > >   */
> > >  struct gpio_desc;
> > > =20
> > > +/**
> > > + * Struct containing an array of descriptors that can be obtaine=
d using
> > > + * gpiod_get_array().
> > > + */
> > > +struct gpio_descs {
> > > +	unsigned int array_size;
> > > +	struct gpio_desc *desc_array[];
> > > +};
> > > +
> > >  #define GPIOD_FLAGS_BIT_DIR_SET		BIT(0)
> > >  #define GPIOD_FLAGS_BIT_DIR_OUT		BIT(1)
> > >  #define GPIOD_FLAGS_BIT_DIR_VAL		BIT(2)
> > > @@ -34,6 +43,9 @@ enum gpiod_flags {
> > > =20
> > >  #ifdef CONFIG_GPIOLIB
> > > =20
> > > +/* Return the number of GPIOs associated with a device / functio=
n */
> > > +int gpiod_count(struct device *dev, const char *con_id);
> > > +
> > >  /* Acquire and dispose GPIOs */
> > >  struct gpio_desc *__must_check __gpiod_get(struct device *dev,
> > >  					 const char *con_id,
> > > @@ -49,7 +61,14 @@ struct gpio_desc *__must_check __gpiod_get_ind=
ex_optional(struct device *dev,
> > >  							const char *con_id,
> > >  							unsigned int index,
> > >  							enum gpiod_flags flags);
> > > +struct gpio_descs *__must_check gpiod_get_array(struct device *d=
ev,
> > > +						const char *con_id,
> > > +						enum gpiod_flags flags);
> > > +struct gpio_descs *__must_check gpiod_get_array_optional(struct =
device *dev,
> > > +							const char *con_id,
> > > +							enum gpiod_flags flags);
> > >  void gpiod_put(struct gpio_desc *desc);
> > > +void gpiod_put_array(struct gpio_descs *descs);
> > > =20
> > >  struct gpio_desc *__must_check __devm_gpiod_get(struct device *d=
ev,
> > >  					      const char *con_id,
> > > @@ -113,6 +132,11 @@ struct gpio_desc *devm_get_gpiod_from_child(=
struct device *dev,
> > >  					    struct fwnode_handle *child);
> > >  #else /* CONFIG_GPIOLIB */
> > > =20
> > > +static inline int gpiod_count(struct device *dev, const char *co=
n_id)
> > > +{
> > > +	return 0;
> > > +}
> > > +
> > >  static inline struct gpio_desc *__must_check __gpiod_get(struct =
device *dev,
> > >  						const char *con_id,
> > >  						enum gpiod_flags flags)
> > > @@ -142,6 +166,20 @@ __gpiod_get_index_optional(struct device *de=
v, const char *con_id,
> > >  	return ERR_PTR(-ENOSYS);
> > >  }
> > > =20
> > > +static inline struct gpio_descs *__must_check
> > > +gpiod_get_array(struct device *dev, const char *con_id,
> > > +		enum gpiod_flags flags)
> > > +{
> > > +	return ERR_PTR(-ENOSYS);
> >=20
> > That should be -ENXIO.
> >=20
>=20
> Why? All the other functions in this section return -ENOSYS.

It means system call not implemented and should only be returned from
those.

> According to include/uapi/asm-generic/errno.h
> ENOSYS means "Function not implemented"
> and in include/uapi/asm-generic/errno-base.h it says
> ENXIO stands for "No such device or address".
>=20
> If ENXIO is more correct here (and I don't see why),

IIRC it was decided (perhaps in last Kernel Summit) that in these cases
we return -ENXIO, not -ENOSYS. But...

> then it should at least be consistent for all functions, right?

=2E..you are right here. It should be consistent accross the file.

> > > +}
> > > +
> > > +static inline struct gpio_descs *__must_check
> > > +gpiod_get_array_optional(struct device *dev, const char *con_id,
> > > +			 enum gpiod_flags flags)
> > > +{
> > > +	return ERR_PTR(-ENOSYS);
> >=20
> > Ditto.
> >=20
> > > +}
> > > +
> > >  static inline void gpiod_put(struct gpio_desc *desc)
> > >  {
> > >  	might_sleep();
> > > @@ -150,6 +188,14 @@ static inline void gpiod_put(struct gpio_des=
c *desc)
> > >  	WARN_ON(1);
> > >  }
> > > =20
> > > +static inline void gpiod_put_array(struct gpio_descs *descs)
> > > +{
> > > +	might_sleep();
> > > +
> > > +	/* GPIO can never have been requested */
> > > +	WARN_ON(1);
> > > +}
> > > +
> > >  static inline struct gpio_desc *__must_check
> > >  __devm_gpiod_get(struct device *dev,
> > >  		 const char *con_id,
> > --
> > To unsubscribe from this list: send the line "unsubscribe linux-gpi=
o" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
> >=20
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
