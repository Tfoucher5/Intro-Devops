<?php

namespace Database\Factories;

use App\Models\Product;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends Factory<Product>
 */
class ProductFactory extends Factory
{
    protected $model = Product::class;

    public function definition()
    {
        return [
            'nom' => $this->faker->word, // Génère un mot aléatoire
            'prix' => $this->faker->randomFloat(2, 1, 100), // Prix entre 1 et 100
        ];
    }
}

